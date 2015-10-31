package com.googlecode.javacpp;

import java.io.File;
import java.util.Arrays;
import java.util.Map;
import java.util.Properties;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.logging.Log;

public class BuildMojo extends AbstractMojo
{
  private String classOrPackageName = null;
  private String[] classOrPackageNames = null;
  private String classPath = null;
  private String[] classPaths = null;
  private boolean compile = true;
  private String[] compilerOptions = null;
  private boolean copyLibs = false;
  private Map<String, String> environmentVariables = null;
  private boolean header = false;
  private String jarPrefix = null;
  private File outputDirectory = null;
  private String outputName = null;
  private String properties = null;
  private File propertyFile = null;
  private Properties propertyKeysAndValues = null;
  private boolean skip = false;

  public void execute()
    throws MojoExecutionException
  {
    while (true)
    {
      try
      {
        getLog().info("Executing JavaCPP Builder");
        if (getLog().isDebugEnabled())
        {
          getLog().debug("classPath: " + this.classPath);
          getLog().debug("classPaths: " + Arrays.deepToString(this.classPaths));
          getLog().debug("outputDirectory: " + this.outputDirectory);
          getLog().debug("outputName: " + this.outputName);
          getLog().debug("compile: " + this.compile);
          getLog().debug("header: " + this.header);
          getLog().debug("copyLibs: " + this.copyLibs);
          getLog().debug("jarPrefix: " + this.jarPrefix);
          getLog().debug("properties: " + this.properties);
          getLog().debug("propertyFile: " + this.propertyFile);
          getLog().debug("propertyKeysAndValues: " + this.propertyKeysAndValues);
          getLog().debug("classOrPackageName: " + this.classOrPackageName);
          getLog().debug("classOrPackageNames: " + Arrays.deepToString(this.classOrPackageNames));
          getLog().debug("environmentVariables: " + this.environmentVariables);
          getLog().debug("compilerOptions: " + Arrays.deepToString(this.compilerOptions));
          getLog().debug("skip: " + this.skip);
        }
        if (this.skip)
        {
          getLog().info("Skipped execution of JavaCPP Builder");
          return;
        }
        if ((this.classPaths != null) && (this.classPath != null))
        {
          this.classPaths = ((String[])Arrays.copyOf(this.classPaths, 1 + this.classPaths.length));
          this.classPaths[(-1 + this.classPaths.length)] = this.classPath;
          if ((this.classOrPackageNames == null) || (this.classOrPackageName == null))
            break label878;
          this.classOrPackageNames = ((String[])Arrays.copyOf(this.classOrPackageNames, 1 + this.classOrPackageNames.length));
          this.classOrPackageNames[(-1 + this.classOrPackageNames.length)] = this.classOrPackageName;
          File[] arrayOfFile = new Builder().classPaths(this.classPaths).outputDirectory(this.outputDirectory).outputName(this.outputName).compile(this.compile).header(this.header).copyLibs(this.copyLibs).jarPrefix(this.jarPrefix).properties(this.properties).propertyFile(this.propertyFile).properties(this.propertyKeysAndValues).classesOrPackages(this.classOrPackageNames).environmentVariables(this.environmentVariables).compilerOptions(this.compilerOptions).build();
          getLog().info("Successfully executed JavaCPP Builder");
          if (!getLog().isDebugEnabled())
            break;
          getLog().debug("outputFiles: " + Arrays.deepToString(arrayOfFile));
          return;
        }
      }
      catch (Exception localException)
      {
        getLog().error("Failed to execute JavaCPP Builder: " + localException.getMessage());
        throw new MojoExecutionException("Failed to execute JavaCPP Builder", localException);
      }
      if (this.classPath != null)
      {
        String[] arrayOfString1 = new String[1];
        arrayOfString1[0] = this.classPath;
        this.classPaths = arrayOfString1;
        continue;
        label878: if (this.classOrPackageName != null)
        {
          String[] arrayOfString2 = new String[1];
          arrayOfString2[0] = this.classOrPackageName;
          this.classOrPackageNames = arrayOfString2;
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.BuildMojo
 * JD-Core Version:    0.6.2
 */