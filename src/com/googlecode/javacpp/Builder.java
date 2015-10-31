package com.googlecode.javacpp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.zip.ZipEntry;

public class Builder
{
  ClassScanner classScanner = null;
  boolean compile = true;
  Collection<String> compilerOptions = null;
  boolean copyLibs = false;
  Map<String, String> environmentVariables = null;
  boolean header = false;
  String jarPrefix = null;
  File outputDirectory = null;
  String outputName = null;
  Properties properties = null;

  public Builder()
  {
    Loader.loadLibraries = false;
    this.properties = Loader.loadProperties();
    this.classScanner = new ClassScanner(new LinkedList(), new UserClassLoader(Thread.currentThread().getContextClassLoader()));
    this.compilerOptions = new LinkedList();
  }

  public static void createJar(File paramFile, String[] paramArrayOfString, File[] paramArrayOfFile)
    throws IOException
  {
    System.out.println("Creating JAR file: " + paramFile);
    JarOutputStream localJarOutputStream = new JarOutputStream(new FileOutputStream(paramFile));
    int i = paramArrayOfFile.length;
    for (int j = 0; j < i; j++)
    {
      File localFile = paramArrayOfFile[j];
      String str1 = localFile.getPath();
      if (paramArrayOfString != null)
      {
        String[] arrayOfString = new String[paramArrayOfString.length];
        for (int m = 0; m < paramArrayOfString.length; m++)
        {
          String str2 = new File(paramArrayOfString[m]).getCanonicalPath();
          if (str1.startsWith(str2))
            arrayOfString[m] = str1.substring(1 + str2.length());
        }
        for (int n = 0; n < arrayOfString.length; n++)
          if ((arrayOfString[n] != null) && (arrayOfString[n].length() < str1.length()))
            str1 = arrayOfString[n];
      }
      ZipEntry localZipEntry = new ZipEntry(str1.replace(File.separatorChar, '/'));
      localZipEntry.setTime(localFile.lastModified());
      localJarOutputStream.putNextEntry(localZipEntry);
      FileInputStream localFileInputStream = new FileInputStream(localFile);
      byte[] arrayOfByte = new byte[1024];
      while (true)
      {
        int k = localFileInputStream.read(arrayOfByte);
        if (k == -1)
          break;
        localJarOutputStream.write(arrayOfByte, 0, k);
      }
      localFileInputStream.close();
      localJarOutputStream.closeEntry();
    }
    localJarOutputStream.close();
  }

  public static void includeJavaPaths(Loader.ClassProperties paramClassProperties, boolean paramBoolean)
  {
    String str1 = Loader.getPlatformName();
    final String str2 = paramClassProperties.getProperty("compiler.link.prefix", "") + "jvm" + paramClassProperties.getProperty("compiler.link.suffix", "");
    final String str3 = paramClassProperties.getProperty("library.prefix", "") + "jvm" + paramClassProperties.getProperty("library.suffix", "");
    String[] arrayOfString1 = new String[2];
    final String[] arrayOfString2 = new String[2];
    FilenameFilter local1 = new FilenameFilter()
    {
      public boolean accept(File paramAnonymousFile, String paramAnonymousString)
      {
        if (new File(paramAnonymousFile, "jni.h").exists())
          this.val$jnipath[0] = paramAnonymousFile.getAbsolutePath();
        if (new File(paramAnonymousFile, "jni_md.h").exists())
          this.val$jnipath[1] = paramAnonymousFile.getAbsolutePath();
        if (new File(paramAnonymousFile, str2).exists())
          arrayOfString2[0] = paramAnonymousFile.getAbsolutePath();
        if (new File(paramAnonymousFile, str3).exists())
          arrayOfString2[1] = paramAnonymousFile.getAbsolutePath();
        return new File(paramAnonymousFile, paramAnonymousString).isDirectory();
      }
    };
    Object localObject1 = new File(System.getProperty("java.home")).getParentFile();
    try
    {
      File localFile4 = ((File)localObject1).getCanonicalFile();
      localObject1 = localFile4;
      localLinkedList = new LinkedList(Arrays.asList(((File)localObject1).listFiles(local1)));
      File[] arrayOfFile;
      int i;
      do
      {
        if (localLinkedList.isEmpty())
          break;
        File localFile2 = (File)localLinkedList.pop();
        str4 = localFile2.getPath();
        arrayOfFile = localFile2.listFiles(local1);
        i = arrayOfFile.length;
        j = 0;
      }
      while (j >= i);
      localObject2 = arrayOfFile[j];
    }
    catch (IOException localIOException1)
    {
      try
      {
        while (true)
        {
          LinkedList localLinkedList;
          String str4;
          int j;
          File localFile3 = ((File)localObject2).getCanonicalFile();
          Object localObject2 = localFile3;
          label223: if (!str4.startsWith(((File)localObject2).getPath()))
            localLinkedList.add(localObject2);
          j++;
        }
        if ((arrayOfString1[0] != null) && (arrayOfString1[0].equals(arrayOfString1[1])))
          arrayOfString1[1] = null;
        while (true)
        {
          if ((arrayOfString2[0] != null) && (arrayOfString2[0].equals(arrayOfString2[1])))
            arrayOfString2[1] = null;
          paramClassProperties.addAll("compiler.includepath", arrayOfString1);
          if (str1.equals(paramClassProperties.getProperty("platform.name", str1)))
          {
            if (paramBoolean)
            {
              paramClassProperties.get("compiler.link").add(0, "jvm");
              paramClassProperties.addAll("compiler.linkpath", arrayOfString2);
            }
            if (str1.startsWith("macosx"))
              paramClassProperties.addAll("compiler.framework", new String[] { "JavaVM" });
          }
          return;
          if (arrayOfString1[0] == null)
          {
            File localFile1 = new File("/System/Library/Frameworks/JavaVM.framework/Headers/");
            if (localFile1.isDirectory())
              arrayOfString1[0] = "/System/Library/Frameworks/JavaVM.framework/Headers/";
          }
        }
        localIOException1 = localIOException1;
      }
      catch (IOException localIOException2)
      {
        break label223;
      }
    }
  }

  public static void main(String[] paramArrayOfString)
    throws Exception
  {
    int i = 0;
    Builder localBuilder = new Builder();
    int j = 0;
    if (j < paramArrayOfString.length)
    {
      if (("-help".equals(paramArrayOfString[j])) || ("--help".equals(paramArrayOfString[j])))
      {
        printHelp();
        System.exit(0);
      }
      while (true)
      {
        j++;
        break;
        if (("-classpath".equals(paramArrayOfString[j])) || ("-cp".equals(paramArrayOfString[j])) || ("-lib".equals(paramArrayOfString[j])))
        {
          j++;
          localBuilder.classPaths(paramArrayOfString[j]);
        }
        else if ("-d".equals(paramArrayOfString[j]))
        {
          j++;
          localBuilder.outputDirectory(paramArrayOfString[j]);
        }
        else if ("-o".equals(paramArrayOfString[j]))
        {
          j++;
          localBuilder.outputName(paramArrayOfString[j]);
        }
        else if (("-cpp".equals(paramArrayOfString[j])) || ("-nocompile".equals(paramArrayOfString[j])))
        {
          localBuilder.compile(false);
        }
        else if ("-header".equals(paramArrayOfString[j]))
        {
          localBuilder.header(true);
        }
        else if ("-copylibs".equals(paramArrayOfString[j]))
        {
          localBuilder.copyLibs(true);
        }
        else if ("-jarprefix".equals(paramArrayOfString[j]))
        {
          j++;
          localBuilder.jarPrefix(paramArrayOfString[j]);
        }
        else if ("-properties".equals(paramArrayOfString[j]))
        {
          j++;
          localBuilder.properties(paramArrayOfString[j]);
        }
        else if ("-propertyfile".equals(paramArrayOfString[j]))
        {
          j++;
          localBuilder.propertyFile(paramArrayOfString[j]);
        }
        else if (paramArrayOfString[j].startsWith("-D"))
        {
          localBuilder.property(paramArrayOfString[j]);
        }
        else if ("-Xcompiler".equals(paramArrayOfString[j]))
        {
          String[] arrayOfString2 = new String[1];
          j++;
          arrayOfString2[0] = paramArrayOfString[j];
          localBuilder.compilerOptions(arrayOfString2);
        }
        else if (paramArrayOfString[j].startsWith("-"))
        {
          System.err.println("Error: Invalid option \"" + paramArrayOfString[j] + "\"");
          printHelp();
          System.exit(1);
        }
        else
        {
          String[] arrayOfString1 = new String[1];
          arrayOfString1[0] = paramArrayOfString[j];
          localBuilder.classesOrPackages(arrayOfString1);
          i = 1;
        }
      }
    }
    if (i == 0)
      localBuilder.classesOrPackages((String[])null);
    localBuilder.build();
  }

  public static void printHelp()
  {
    String str = Builder.class.getPackage().getImplementationVersion();
    if (str == null)
      str = "unknown";
    System.out.println("JavaCPP version " + str + "\n" + "Copyright (C) 2011-2013 Samuel Audet <samuel.audet@gmail.com>\n" + "Project site: http://code.google.com/p/javacpp/\n\n" + "Licensed under the GNU General Public License version 2 (GPLv2) with Classpath exception.\n" + "Please refer to LICENSE.txt or http://www.gnu.org/licenses/ for details.");
    System.out.println();
    System.out.println("Usage: java -jar javacpp.jar [options] [class or package (suffixed with .* or .**)]");
    System.out.println();
    System.out.println("where options include:");
    System.out.println();
    System.out.println("    -classpath <path>      Load user classes from path");
    System.out.println("    -d <directory>         Output all generated files to directory");
    System.out.println("    -o <name>              Output everything in a file named after given name");
    System.out.println("    -nocompile             Do not compile or delete the generated source files");
    System.out.println("    -header                Generate header file with declarations of callbacks functions");
    System.out.println("    -copylibs              Copy to output directory dependent libraries (link and preload)");
    System.out.println("    -jarprefix <prefix>    Also create a JAR file named \"<prefix>-<platform.name>.jar\"");
    System.out.println("    -properties <resource> Load all properties from resource");
    System.out.println("    -propertyfile <file>   Load all properties from file");
    System.out.println("    -D<property>=<value>   Set property to value");
    System.out.println("    -Xcompiler <option>    Pass option directly to compiler");
    System.out.println();
  }

  public File[] build()
    throws IOException, InterruptedException, Parser.Exception
  {
    File[] arrayOfFile;
    if (this.classScanner.getClasses().isEmpty())
      arrayOfFile = null;
    label226: 
    do
    {
      return arrayOfFile;
      LinkedList localLinkedList1 = new LinkedList();
      LinkedHashMap localLinkedHashMap = new LinkedHashMap();
      Iterator localIterator1 = this.classScanner.getClasses().iterator();
      while (localIterator1.hasNext())
      {
        Class localClass = (Class)localIterator1.next();
        if (Loader.getEnclosingClass(localClass) == localClass)
        {
          Loader.ClassProperties localClassProperties3 = Loader.loadProperties(localClass, this.properties, false);
          String str2 = localClassProperties3.getProperty("parser.target");
          if ((str2 != null) && (!localClass.getName().equals(str2)))
          {
            File localFile7 = parse(localClass);
            if (localFile7 != null)
              localLinkedList1.add(localFile7);
          }
          else
          {
            if (this.outputName != null);
            for (String str3 = this.outputName; ; str3 = localClassProperties3.getProperty("loader.library", ""))
            {
              if (str3.length() == 0)
                break label226;
              LinkedList localLinkedList4 = (LinkedList)localLinkedHashMap.get(str3);
              if (localLinkedList4 == null)
              {
                localLinkedList4 = new LinkedList();
                localLinkedHashMap.put(str3, localLinkedList4);
              }
              localLinkedList4.add(localClass);
              break;
            }
          }
        }
      }
      Iterator localIterator2 = localLinkedHashMap.keySet().iterator();
      while (localIterator2.hasNext())
      {
        String str1 = (String)localIterator2.next();
        LinkedList localLinkedList2 = (LinkedList)localLinkedHashMap.get(str1);
        Class[] arrayOfClass = (Class[])localLinkedList2.toArray(new Class[localLinkedList2.size()]);
        File localFile3 = generateAndCompile(arrayOfClass, str1);
        if (localFile3 != null)
        {
          localLinkedList1.add(localFile3);
          if (this.copyLibs)
          {
            Loader.ClassProperties localClassProperties1 = Loader.loadProperties(arrayOfClass, this.properties, false);
            LinkedList localLinkedList3 = new LinkedList();
            localLinkedList3.addAll(localClassProperties1.get("loader.preload"));
            localLinkedList3.addAll(localClassProperties1.get("compiler.link"));
            Loader.ClassProperties localClassProperties2 = Loader.loadProperties(arrayOfClass, this.properties, true);
            File localFile4 = localFile3.getParentFile();
            Iterator localIterator3 = localLinkedList3.iterator();
            while (localIterator3.hasNext())
            {
              URL[] arrayOfURL = Loader.findLibrary(null, localClassProperties2, (String)localIterator3.next());
              File localFile6;
              FileInputStream localFileInputStream;
              FileOutputStream localFileOutputStream;
              try
              {
                File localFile5 = new File(arrayOfURL[0].toURI());
                localFile6 = new File(localFile4, localFile5.getName());
                if ((!localFile5.exists()) || (localLinkedList1.contains(localFile6)))
                  continue;
                System.out.println("Copying library file: " + localFile5);
                localFileInputStream = new FileInputStream(localFile5);
                localFileOutputStream = new FileOutputStream(localFile6);
                byte[] arrayOfByte = new byte[1024];
                while (true)
                {
                  int i = localFileInputStream.read(arrayOfByte);
                  if (i == -1)
                    break;
                  localFileOutputStream.write(arrayOfByte, 0, i);
                }
              }
              catch (Exception localException)
              {
              }
              continue;
              localFileOutputStream.close();
              localFileInputStream.close();
              localLinkedList1.add(localFile6);
            }
          }
        }
      }
      arrayOfFile = (File[])localLinkedList1.toArray(new File[localLinkedList1.size()]);
    }
    while ((this.jarPrefix == null) || (arrayOfFile.length <= 0));
    File localFile1 = new File(this.jarPrefix + "-" + this.properties.get("platform.name") + ".jar");
    File localFile2 = localFile1.getParentFile();
    if ((localFile2 != null) && (!localFile2.exists()))
      localFile2.mkdir();
    if (this.outputDirectory == null);
    for (String[] arrayOfString = this.classScanner.getClassLoader().getPaths(); ; arrayOfString = null)
    {
      createJar(localFile1, arrayOfString, arrayOfFile);
      return arrayOfFile;
    }
  }

  public Builder classPaths(String paramString)
  {
    if (paramString == null);
    for (String[] arrayOfString = null; ; arrayOfString = paramString.split(File.pathSeparator))
    {
      classPaths(arrayOfString);
      return this;
    }
  }

  public Builder classPaths(String[] paramArrayOfString)
  {
    this.classScanner.getClassLoader().addPaths(paramArrayOfString);
    return this;
  }

  public Builder classesOrPackages(String[] paramArrayOfString)
    throws IOException
  {
    if (paramArrayOfString == null)
      this.classScanner.addPackage(null, true);
    while (true)
    {
      return this;
      int i = paramArrayOfString.length;
      for (int j = 0; j < i; j++)
      {
        String str = paramArrayOfString[j];
        this.classScanner.addClassOrPackage(str);
      }
    }
  }

  public int compile(String paramString1, String paramString2, Loader.ClassProperties paramClassProperties)
    throws IOException, InterruptedException
  {
    LinkedList localLinkedList1 = new LinkedList();
    includeJavaPaths(paramClassProperties, this.header);
    String str1 = Loader.getPlatformName();
    localLinkedList1.add(paramClassProperties.getProperty("compiler.path"));
    String str2 = paramClassProperties.getProperty("compiler.sysroot.prefix", "");
    Iterator localIterator1 = paramClassProperties.get("compiler.sysroot").iterator();
    while (localIterator1.hasNext())
    {
      String str21 = (String)localIterator1.next();
      File localFile3 = new File(str21);
      if (localFile3.isDirectory())
        if (str2.endsWith(" "))
        {
          localLinkedList1.add(str2.trim());
          localLinkedList1.add(str21);
        }
        else
        {
          localLinkedList1.add(str2 + str21);
        }
    }
    String str3 = paramClassProperties.getProperty("compiler.includepath.prefix", "");
    Iterator localIterator2 = paramClassProperties.get("compiler.includepath").iterator();
    while (localIterator2.hasNext())
    {
      String str20 = (String)localIterator2.next();
      File localFile2 = new File(str20);
      if (localFile2.isDirectory())
        if (str3.endsWith(" "))
        {
          localLinkedList1.add(str3.trim());
          localLinkedList1.add(str20);
        }
        else
        {
          localLinkedList1.add(str3 + str20);
        }
    }
    localLinkedList1.add(paramString1);
    LinkedList localLinkedList2 = paramClassProperties.get("compiler.options");
    if (localLinkedList2.isEmpty())
      localLinkedList2.add("default");
    Iterator localIterator3 = localLinkedList2.iterator();
    while (localIterator3.hasNext())
    {
      String str17 = (String)localIterator3.next();
      if ((str17 != null) && (str17.length() != 0))
      {
        String str18 = "compiler.options." + str17;
        String str19 = paramClassProperties.getProperty(str18);
        if ((str19 != null) && (str19.length() > 0))
          localLinkedList1.addAll(Arrays.asList(str19.split(" ")));
        else if (!"default".equals(str17))
          System.err.println("Warning: Could not get the property named \"" + str18 + "\"");
      }
    }
    localLinkedList1.addAll(this.compilerOptions);
    String str4 = paramClassProperties.getProperty("compiler.output.prefix");
    if ((str4 != null) && (str4.length() > 0))
      localLinkedList1.addAll(Arrays.asList(str4.split(" ")));
    String str5;
    String str6;
    Iterator localIterator4;
    if ((str4 == null) || (str4.length() == 0) || (str4.endsWith(" ")))
    {
      localLinkedList1.add(paramString2);
      str5 = paramClassProperties.getProperty("compiler.linkpath.prefix", "");
      str6 = paramClassProperties.getProperty("compiler.linkpath.prefix2");
      localIterator4 = paramClassProperties.get("compiler.linkpath").iterator();
    }
    while (true)
    {
      label591: if (!localIterator4.hasNext())
        break label792;
      String str16 = (String)localIterator4.next();
      File localFile1 = new File(str16);
      if (localFile1.isDirectory())
      {
        if (str5.endsWith(" "))
        {
          localLinkedList1.add(str5.trim());
          localLinkedList1.add(str16);
        }
        while (true)
        {
          if (str6 == null)
            break label761;
          if (!str6.endsWith(" "))
            break label763;
          localLinkedList1.add(str6.trim());
          localLinkedList1.add(str16);
          break label591;
          localLinkedList1.add((String)localLinkedList1.removeLast() + paramString2);
          break;
          localLinkedList1.add(str5 + str16);
        }
        label761: continue;
        label763: localLinkedList1.add(str6 + str16);
      }
    }
    label792: String str7 = paramClassProperties.getProperty("compiler.link.prefix", "");
    String str8 = paramClassProperties.getProperty("compiler.link.suffix", "");
    int i = localLinkedList1.size();
    Iterator localIterator5 = paramClassProperties.get("compiler.link").iterator();
    while (localIterator5.hasNext())
    {
      String[] arrayOfString = ((String)localIterator5.next()).split("@");
      if ((arrayOfString.length == 3) && (arrayOfString[1].length() == 0));
      for (String str15 = arrayOfString[0] + arrayOfString[2]; ; str15 = arrayOfString[0])
      {
        if ((!str7.endsWith(" ")) || (!str8.startsWith(" ")))
          break label973;
        localLinkedList1.add(i, str7.trim());
        localLinkedList1.add(i + 1, str15);
        localLinkedList1.add(i + 2, str8.trim());
        break;
      }
      label973: if (str7.endsWith(" "))
      {
        localLinkedList1.add(i, str7.trim());
        localLinkedList1.add(i + 1, str15 + str8);
      }
      else if (str8.startsWith(" "))
      {
        localLinkedList1.add(i, str7 + str15);
        localLinkedList1.add(i + 1, str8.trim());
      }
      else
      {
        localLinkedList1.add(i, str7 + str15 + str8);
      }
    }
    String str9 = paramClassProperties.getProperty("compiler.framework.prefix", "");
    String str10 = paramClassProperties.getProperty("compiler.framework.suffix", "");
    Iterator localIterator6 = paramClassProperties.get("compiler.framework").iterator();
    while (localIterator6.hasNext())
    {
      String str14 = (String)localIterator6.next();
      if ((str9.endsWith(" ")) && (str10.startsWith(" ")))
      {
        localLinkedList1.add(str9.trim());
        localLinkedList1.add(str14);
        localLinkedList1.add(str10.trim());
      }
      else if (str9.endsWith(" "))
      {
        localLinkedList1.add(str9.trim());
        localLinkedList1.add(str14 + str10);
      }
      else if (str10.startsWith(" "))
      {
        localLinkedList1.add(str9 + str14);
        localLinkedList1.add(str10.trim());
      }
      else
      {
        localLinkedList1.add(str9 + str14 + str10);
      }
    }
    boolean bool = str1.startsWith("windows");
    Iterator localIterator7 = localLinkedList1.iterator();
    if (localIterator7.hasNext())
    {
      String str11 = (String)localIterator7.next();
      int j;
      label1418: String str13;
      label1438: PrintStream localPrintStream1;
      if (str11.indexOf(" ") > 0)
      {
        j = 1;
        if (j != 0)
        {
          PrintStream localPrintStream2 = System.out;
          if (!bool)
            break label1498;
          str13 = "\"";
          localPrintStream2.print(str13);
        }
        System.out.print(str11);
        if (j != 0)
        {
          localPrintStream1 = System.out;
          if (!bool)
            break label1506;
        }
      }
      label1498: label1506: for (String str12 = "\""; ; str12 = "'")
      {
        localPrintStream1.print(str12);
        System.out.print(" ");
        break;
        j = 0;
        break label1418;
        str13 = "'";
        break label1438;
      }
    }
    System.out.println();
    ProcessBuilder localProcessBuilder = new ProcessBuilder(localLinkedList1);
    if (this.environmentVariables != null)
      localProcessBuilder.environment().putAll(this.environmentVariables);
    Process localProcess = localProcessBuilder.start();
    new Piper(localProcess.getErrorStream(), System.err).start();
    new Piper(localProcess.getInputStream(), System.out).start();
    return localProcess.waitFor();
  }

  public Builder compile(boolean paramBoolean)
  {
    this.compile = paramBoolean;
    return this;
  }

  public Builder compilerOptions(String[] paramArrayOfString)
  {
    if (paramArrayOfString != null)
      this.compilerOptions.addAll(Arrays.asList(paramArrayOfString));
    return this;
  }

  public Builder copyLibs(boolean paramBoolean)
  {
    this.copyLibs = paramBoolean;
    return this;
  }

  public Builder environmentVariables(Map<String, String> paramMap)
  {
    this.environmentVariables = paramMap;
    return this;
  }

  public File generateAndCompile(Class[] paramArrayOfClass, String paramString)
    throws IOException, InterruptedException
  {
    Loader.ClassProperties localClassProperties = Loader.loadProperties(paramArrayOfClass, this.properties, true);
    String str1 = localClassProperties.getProperty("platform.name");
    String str2 = localClassProperties.getProperty("source.suffix", ".cpp");
    String str3 = localClassProperties.getProperty("library.prefix", "") + paramString + localClassProperties.getProperty("library.suffix", "");
    if (this.outputDirectory == null);
    File localFile1;
    Generator localGenerator;
    String str5;
    String str6;
    String str7;
    while (true)
    {
      try
      {
        File localFile3 = new File(paramArrayOfClass[0].getResource('/' + paramArrayOfClass[0].getName().replace('.', '/') + ".class").toURI()).getParentFile();
        localFile1 = new File(localFile3, str1);
        String str10 = localFile3.getPath() + File.separator + paramString;
        str4 = str10;
        if (!localFile1.exists())
          localFile1.mkdirs();
        localGenerator = new Generator(localClassProperties);
        str5 = str4 + str2;
        if (!this.header)
          break label388;
        str6 = str4 + ".h";
        str7 = System.getProperty("java.class.path");
        String[] arrayOfString = this.classScanner.getClassLoader().getPaths();
        int i = arrayOfString.length;
        int j = 0;
        if (j >= i)
          break;
        String str9 = arrayOfString[j];
        str7 = str7 + File.pathSeparator + str9;
        j++;
        continue;
      }
      catch (URISyntaxException localURISyntaxException)
      {
        RuntimeException localRuntimeException = new RuntimeException(localURISyntaxException);
        throw localRuntimeException;
      }
      localFile1 = this.outputDirectory;
      String str4 = localFile1.getPath() + File.separator + paramString;
      continue;
      label388: str6 = null;
    }
    System.out.println("Generating source file: " + str5);
    if (localGenerator.generate(str5, str6, str7, paramArrayOfClass))
    {
      localGenerator.close();
      if (this.compile)
      {
        String str8 = localFile1.getPath() + File.separator + str3;
        System.out.println("Compiling library file: " + str8);
        int k = compile(str5, str8, localClassProperties);
        if (k == 0)
        {
          File localFile2 = new File(str5);
          localFile2.delete();
          return new File(str8);
        }
        System.exit(k);
        return null;
      }
      return new File(str5);
    }
    System.out.println("Source file not generated: " + str5);
    return null;
  }

  public Builder header(boolean paramBoolean)
  {
    this.header = paramBoolean;
    return this;
  }

  public Builder jarPrefix(String paramString)
  {
    this.jarPrefix = paramString;
    return this;
  }

  public Builder outputDirectory(File paramFile)
  {
    this.outputDirectory = paramFile;
    return this;
  }

  public Builder outputDirectory(String paramString)
  {
    if (paramString == null);
    for (File localFile = null; ; localFile = new File(paramString))
    {
      outputDirectory(localFile);
      return this;
    }
  }

  public Builder outputName(String paramString)
  {
    this.outputName = paramString;
    return this;
  }

  public File parse(Class paramClass)
    throws IOException, Parser.Exception
  {
    Parser.InfoMap localInfoMap = new Parser.InfoMap();
    try
    {
      Object localObject = paramClass.newInstance();
      if ((localObject instanceof Parser.InfoMapper))
        ((Parser.InfoMapper)localObject).map(localInfoMap);
      label33: return new Parser(this.properties, localInfoMap).parse(this.outputDirectory, paramClass);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      break label33;
    }
    catch (InstantiationException localInstantiationException)
    {
      break label33;
    }
  }

  public Builder properties(String paramString)
  {
    if (paramString == null);
    for (Properties localProperties = null; ; localProperties = Loader.loadProperties(paramString))
    {
      properties(localProperties);
      return this;
    }
  }

  public Builder properties(Properties paramProperties)
  {
    if (paramProperties != null)
      this.properties.putAll(paramProperties);
    return this;
  }

  public Builder property(String paramString)
  {
    int i = paramString.indexOf('=');
    if (i < 0)
      i = paramString.indexOf(':');
    property(paramString.substring(2, i), paramString.substring(i + 1));
    return this;
  }

  public Builder property(String paramString1, String paramString2)
  {
    if ((paramString1.length() > 0) && (paramString2.length() > 0))
      this.properties.put(paramString1, paramString2);
    return this;
  }

  public Builder propertyFile(File paramFile)
    throws IOException
  {
    if (paramFile == null)
      return this;
    FileInputStream localFileInputStream = new FileInputStream(paramFile);
    this.properties = new Properties(this.properties);
    try
    {
      this.properties.load(new InputStreamReader(localFileInputStream));
      localFileInputStream.close();
      return this;
    }
    catch (NoSuchMethodError localNoSuchMethodError)
    {
      while (true)
        this.properties.load(localFileInputStream);
    }
  }

  public Builder propertyFile(String paramString)
    throws IOException
  {
    if (paramString == null);
    for (File localFile = null; ; localFile = new File(paramString))
    {
      propertyFile(localFile);
      return this;
    }
  }

  public static class ClassScanner
  {
    private Collection<Class> classes;
    private Builder.UserClassLoader loader;

    public ClassScanner(Collection<Class> paramCollection, Builder.UserClassLoader paramUserClassLoader)
    {
      this.classes = paramCollection;
      this.loader = paramUserClassLoader;
    }

    public void addClass(String paramString)
    {
      if (paramString == null);
      while (true)
      {
        return;
        if (paramString.endsWith(".class"))
          paramString = paramString.substring(0, -6 + paramString.length());
        try
        {
          Class localClass = Class.forName(paramString, false, this.loader);
          if (!this.classes.contains(localClass))
          {
            this.classes.add(localClass);
            return;
          }
        }
        catch (ClassNotFoundException localClassNotFoundException)
        {
          System.err.println("Warning: Could not find class " + paramString + ": " + localClassNotFoundException);
          return;
        }
        catch (NoClassDefFoundError localNoClassDefFoundError)
        {
          System.err.println("Warning: Could not load class " + paramString + ": " + localNoClassDefFoundError);
        }
      }
    }

    public void addClassOrPackage(String paramString)
      throws IOException
    {
      if (paramString == null)
        return;
      String str = paramString.replace('/', '.');
      if (str.endsWith(".**"))
      {
        addPackage(str.substring(0, -3 + str.length()), true);
        return;
      }
      if (str.endsWith(".*"))
      {
        addPackage(str.substring(0, -2 + str.length()), false);
        return;
      }
      addClass(str);
    }

    public void addMatchingDir(String paramString1, File paramFile, String paramString2, boolean paramBoolean)
    {
      File[] arrayOfFile = paramFile.listFiles();
      Arrays.sort(arrayOfFile);
      int i = arrayOfFile.length;
      int j = 0;
      if (j < i)
      {
        File localFile = arrayOfFile[j];
        String str;
        if (paramString1 == null)
        {
          str = localFile.getName();
          label44: if (!localFile.isDirectory())
            break label114;
          addMatchingDir(str + "/", localFile, paramString2, paramBoolean);
        }
        while (true)
        {
          j++;
          break;
          str = paramString1 + localFile.getName();
          break label44;
          label114: addMatchingFile(str, paramString2, paramBoolean);
        }
      }
    }

    public void addMatchingFile(String paramString1, String paramString2, boolean paramBoolean)
    {
      if ((paramString1 != null) && (paramString1.endsWith(".class")) && ((paramString2 == null) || ((paramBoolean) && (paramString1.startsWith(paramString2))) || (paramString1.regionMatches(0, paramString2, 0, Math.max(paramString1.lastIndexOf('/'), paramString2.lastIndexOf('/'))))))
        addClass(paramString1.replace('/', '.'));
    }

    public void addPackage(String paramString, boolean paramBoolean)
      throws IOException
    {
      String[] arrayOfString = this.loader.getPaths();
      String str;
      int i;
      int k;
      label33: File localFile;
      if (paramString == null)
      {
        str = null;
        i = this.classes.size();
        int j = arrayOfString.length;
        k = 0;
        if (k >= j)
          break label173;
        localFile = new File(arrayOfString[k]);
        if (!localFile.isDirectory())
          break label108;
        addMatchingDir(null, localFile, str, paramBoolean);
      }
      while (true)
      {
        k++;
        break label33;
        str = paramString.replace('.', '/') + "/";
        break;
        label108: JarInputStream localJarInputStream = new JarInputStream(new FileInputStream(localFile));
        for (ZipEntry localZipEntry = localJarInputStream.getNextEntry(); localZipEntry != null; localZipEntry = localJarInputStream.getNextEntry())
        {
          addMatchingFile(localZipEntry.getName(), str, paramBoolean);
          localJarInputStream.closeEntry();
        }
        localJarInputStream.close();
      }
      label173: if ((this.classes.size() == 0) && (paramString == null))
      {
        System.err.println("Warning: No classes found in the unnamed package");
        Builder.printHelp();
      }
      while ((i != this.classes.size()) || (paramString == null))
        return;
      System.err.println("Warning: No classes found in package " + paramString);
    }

    public Builder.UserClassLoader getClassLoader()
    {
      return this.loader;
    }

    public Collection<Class> getClasses()
    {
      return this.classes;
    }
  }

  public static class Piper extends Thread
  {
    InputStream is;
    OutputStream os;

    public Piper(InputStream paramInputStream, OutputStream paramOutputStream)
    {
      this.is = paramInputStream;
      this.os = paramOutputStream;
    }

    public void run()
    {
      try
      {
        byte[] arrayOfByte = new byte[1024];
        while (true)
        {
          int i = this.is.read(arrayOfByte);
          if (i == -1)
            break;
          this.os.write(arrayOfByte, 0, i);
        }
      }
      catch (IOException localIOException)
      {
        System.err.println("Could not pipe from the InputStream to the OutputStream: " + localIOException.getMessage());
      }
    }
  }

  public static class UserClassLoader extends URLClassLoader
  {
    private LinkedList<String> paths = new LinkedList();

    public UserClassLoader()
    {
      super();
    }

    public UserClassLoader(ClassLoader paramClassLoader)
    {
      super(paramClassLoader);
    }

    public void addPaths(String[] paramArrayOfString)
    {
      if (paramArrayOfString == null)
        return;
      int i = paramArrayOfString.length;
      int j = 0;
      label10: String str;
      File localFile;
      if (j < i)
      {
        str = paramArrayOfString[j];
        localFile = new File(str);
        if (localFile.exists())
          break label45;
      }
      while (true)
      {
        j++;
        break label10;
        break;
        label45: this.paths.add(str);
        try
        {
          addURL(localFile.toURI().toURL());
        }
        catch (MalformedURLException localMalformedURLException)
        {
          throw new RuntimeException(localMalformedURLException);
        }
      }
    }

    protected Class<?> findClass(String paramString)
      throws ClassNotFoundException
    {
      if (this.paths.isEmpty())
      {
        String[] arrayOfString = new String[1];
        arrayOfString[0] = System.getProperty("user.dir");
        addPaths(arrayOfString);
      }
      return super.findClass(paramString);
    }

    public String[] getPaths()
    {
      if (this.paths.isEmpty())
      {
        String[] arrayOfString = new String[1];
        arrayOfString[0] = System.getProperty("user.dir");
        addPaths(arrayOfString);
      }
      return (String[])this.paths.toArray(new String[this.paths.size()]);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.Builder
 * JD-Core Version:    0.6.2
 */