package com.googlecode.javacpp;

import com.googlecode.javacpp.annotation.Adapter;
import com.googlecode.javacpp.annotation.Allocator;
import com.googlecode.javacpp.annotation.ArrayAllocator;
import com.googlecode.javacpp.annotation.ByPtr;
import com.googlecode.javacpp.annotation.ByPtrPtr;
import com.googlecode.javacpp.annotation.ByPtrRef;
import com.googlecode.javacpp.annotation.ByRef;
import com.googlecode.javacpp.annotation.ByVal;
import com.googlecode.javacpp.annotation.Cast;
import com.googlecode.javacpp.annotation.Const;
import com.googlecode.javacpp.annotation.Convention;
import com.googlecode.javacpp.annotation.Function;
import com.googlecode.javacpp.annotation.Index;
import com.googlecode.javacpp.annotation.MemberGetter;
import com.googlecode.javacpp.annotation.MemberSetter;
import com.googlecode.javacpp.annotation.Name;
import com.googlecode.javacpp.annotation.Namespace;
import com.googlecode.javacpp.annotation.NoDeallocator;
import com.googlecode.javacpp.annotation.NoException;
import com.googlecode.javacpp.annotation.NoOffset;
import com.googlecode.javacpp.annotation.Opaque;
import com.googlecode.javacpp.annotation.Platform;
import com.googlecode.javacpp.annotation.Properties;
import com.googlecode.javacpp.annotation.Raw;
import com.googlecode.javacpp.annotation.ValueGetter;
import com.googlecode.javacpp.annotation.ValueSetter;
import java.io.Closeable;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.Writer;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.ShortBuffer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Generator
  implements Closeable
{
  public static final java.lang.String JNI_VERSION = "JNI_VERSION_1_6";
  private static final List<Class> baseClasses = Arrays.asList(new Class[] { Pointer.class, BytePointer.class, ShortPointer.class, IntPointer.class, LongPointer.class, FloatPointer.class, DoublePointer.class, CharPointer.class, PointerPointer.class, BoolPointer.class, CLongPointer.class, SizeTPointer.class });
  private static final Logger logger = Logger.getLogger(Generator.class.getName());
  private LinkedListRegister<Class> arrayDeallocators;
  private LinkedListRegister<Class> deallocators;
  private LinkedListRegister<java.lang.String> functionDefinitions;
  private LinkedListRegister<java.lang.String> functionPointers;
  private LinkedListRegister<Class> jclasses;
  private LinkedListRegister<Class> jclassesInit;
  private boolean mayThrowExceptions;
  private HashMap<Class, LinkedList<java.lang.String>> members;
  private PrintWriter out;
  private PrintWriter out2;
  private Loader.ClassProperties properties;
  private boolean usesAdapters;

  public Generator(Loader.ClassProperties paramClassProperties)
  {
    this.properties = paramClassProperties;
  }

  private void doCall(MethodInformation paramMethodInformation, java.lang.String paramString)
  {
    java.lang.String str1;
    java.lang.String str2;
    java.lang.String str3;
    int i;
    int j;
    if (paramMethodInformation.throwsException != null)
    {
      str1 = "        ";
      str2 = "(";
      str3 = ")";
      i = 0;
      if ((!paramMethodInformation.method.isAnnotationPresent(Index.class)) && ((paramMethodInformation.pairedMethod == null) || (!paramMethodInformation.pairedMethod.isAnnotationPresent(Index.class))))
        break label199;
      j = 1;
      label55: if (!paramMethodInformation.deallocator)
        break label205;
      this.out.println(str1 + "void* allocatedAddress = jlong_to_ptr(arg0);");
      this.out.println(str1 + "void (*deallocatorAddress)(void*) = (void(*)(void*))jlong_to_ptr(arg1);");
      this.out.println(str1 + "if (deallocatorAddress != NULL && allocatedAddress != NULL) {");
      this.out.println(str1 + "    (*deallocatorAddress)(allocatedAddress);");
      this.out.println(str1 + "}");
    }
    label199: label205: label344: label348: 
    do
    {
      return;
      str1 = "    ";
      break;
      j = 0;
      break label55;
      int k;
      int m;
      int n;
      PrintWriter localPrintWriter2;
      StringBuilder localStringBuilder1;
      if ((paramMethodInformation.valueGetter) || (paramMethodInformation.valueSetter) || (paramMethodInformation.memberGetter) || (paramMethodInformation.memberSetter))
      {
        k = -1 + paramMethodInformation.parameterTypes.length;
        if (((paramMethodInformation.valueSetter) || (paramMethodInformation.memberSetter)) && (!(getParameterBy(paramMethodInformation, k) instanceof ByRef)) && (getParameterAdapterInformation(false, paramMethodInformation, k) == null) && (paramMethodInformation.parameterTypes[k] == java.lang.String.class))
        {
          this.out.print(str1 + "strcpy((char*)");
          m = 1;
          str2 = ", ";
          if (!Modifier.isStatic(paramMethodInformation.modifiers))
            break label667;
          this.out.print(getCPPScopeName(paramMethodInformation));
          n = i;
          if (n >= paramMethodInformation.dim)
            break label1217;
          java.lang.String str7 = getParameterCast(paramMethodInformation, n);
          localPrintWriter2 = this.out;
          localStringBuilder1 = new StringBuilder().append("[").append(str7);
          if (!paramMethodInformation.parameterTypes[n].isPrimitive())
            break label1209;
        }
      }
      for (java.lang.String str8 = "arg"; ; str8 = "ptr")
      {
        localPrintWriter2.print(str8 + n + "]");
        n++;
        break label348;
        if ((k >= 1) && (paramMethodInformation.parameterTypes[0].isArray()) && (paramMethodInformation.parameterTypes[0].getComponentType().isPrimitive()) && ((paramMethodInformation.parameterTypes[1] == Integer.TYPE) || (paramMethodInformation.parameterTypes[1] == Long.TYPE)))
        {
          this.out.print(str1 + "memcpy(");
          m = 1;
          str2 = ", ";
          if ((paramMethodInformation.memberGetter) || (paramMethodInformation.valueGetter))
            this.out.print("ptr0 + arg1, ");
          while (true)
          {
            i = 2;
            str3 = " * sizeof(*ptr0)" + str3;
            break;
            str2 = str2 + "ptr0 + arg1, ";
          }
        }
        this.out.print(str1 + paramString);
        if ((paramMethodInformation.valueGetter) || (paramMethodInformation.memberGetter));
        for (str2 = ""; ; str2 = " = ")
        {
          str3 = "";
          i = 0;
          m = 0;
          break;
        }
        if ((paramMethodInformation.memberGetter) || (paramMethodInformation.memberSetter))
        {
          if (j != 0)
          {
            this.out.print("(*ptr)");
            str2 = "." + paramMethodInformation.memberName[0] + str2;
            break label344;
          }
          this.out.print("ptr->" + paramMethodInformation.memberName[0]);
          break label344;
        }
        PrintWriter localPrintWriter3 = this.out;
        java.lang.String str9;
        if (j != 0)
          str9 = "(*ptr)";
        while (true)
        {
          localPrintWriter3.print(str9);
          break;
          if ((paramMethodInformation.dim > 0) || (m != 0))
            str9 = "ptr";
          else
            str9 = "*ptr";
        }
        if (paramMethodInformation.bufferGetter)
        {
          this.out.print(str1 + paramString + "ptr");
          str2 = "";
          str3 = "";
          i = 0;
          break label344;
        }
        this.out.print(str1 + paramString);
        if (FunctionPointer.class.isAssignableFrom(paramMethodInformation.cls))
        {
          if (paramMethodInformation.cls.isAnnotationPresent(Namespace.class))
          {
            this.out.print("(ptr0->*(ptr->ptr))");
            i = 1;
            break label344;
          }
          this.out.print("(*ptr->ptr)");
          i = 0;
          break label344;
        }
        if (paramMethodInformation.allocator)
        {
          java.lang.String[] arrayOfString = getCPPTypeName(paramMethodInformation.cls);
          java.lang.String str10 = getValueTypeName(arrayOfString);
          if (paramMethodInformation.cls == Pointer.class)
          {
            str2 = "";
            str3 = "";
            i = 0;
            break label344;
          }
          PrintWriter localPrintWriter4 = this.out;
          StringBuilder localStringBuilder2 = new StringBuilder();
          if (getNoException(paramMethodInformation.cls, paramMethodInformation.method));
          for (java.lang.String str11 = "new (std::nothrow) "; ; str11 = "new ")
          {
            localPrintWriter4.print(str11 + str10 + arrayOfString[1]);
            boolean bool = paramMethodInformation.arrayAllocator;
            i = 0;
            if (!bool)
              break;
            str2 = "[";
            str3 = "]";
            i = 0;
            break;
          }
        }
        if (Modifier.isStatic(paramMethodInformation.modifiers))
        {
          this.out.print(getCPPScopeName(paramMethodInformation));
          i = 0;
          break label344;
        }
        if (j != 0)
        {
          this.out.print("(*ptr)");
          str2 = "." + paramMethodInformation.memberName[0] + str2;
          i = 0;
          break label344;
        }
        this.out.print("ptr->" + paramMethodInformation.memberName[0]);
        i = 0;
        break label344;
      }
      if (paramMethodInformation.memberName.length > 1)
        this.out.print(paramMethodInformation.memberName[1]);
      this.out.print(str2);
      java.lang.String str6;
      if (paramMethodInformation.withEnv)
      {
        PrintWriter localPrintWriter1 = this.out;
        if (!Modifier.isStatic(paramMethodInformation.modifiers))
          break label1447;
        str6 = "env, cls";
        localPrintWriter1.print(str6);
        if (paramMethodInformation.parameterTypes.length - i - paramMethodInformation.dim > 0)
          this.out.print(", ");
      }
      int i1 = i + paramMethodInformation.dim;
      if (i1 < paramMethodInformation.parameterTypes.length)
      {
        Annotation localAnnotation = getParameterBy(paramMethodInformation, i1);
        java.lang.String str4 = getParameterCast(paramMethodInformation, i1);
        AdapterInformation localAdapterInformation = getParameterAdapterInformation(false, paramMethodInformation, i1);
        if ((("(void*)".equals(str4)) || ("(void *)".equals(str4))) && (paramMethodInformation.parameterTypes[i1] == Long.TYPE))
          this.out.print("jlong_to_ptr(arg" + i1 + ")");
        while (true)
        {
          if (i1 < -1 + paramMethodInformation.parameterTypes.length)
            this.out.print(", ");
          i1++;
          break label1317;
          str6 = "env, obj";
          break;
          if (paramMethodInformation.parameterTypes[i1].isPrimitive())
          {
            this.out.print(str4 + "arg" + i1);
          }
          else if (localAdapterInformation != null)
          {
            java.lang.String str5 = localAdapterInformation.cast.trim();
            if ((str5.length() > 0) && (!str5.startsWith("(")) && (!str5.endsWith(")")))
              str5 = "(" + str5 + ")";
            this.out.print(str5 + "adapter" + i1);
            i1 += -1 + localAdapterInformation.argc;
          }
          else if ((FunctionPointer.class.isAssignableFrom(paramMethodInformation.parameterTypes[i1])) && (localAnnotation == null))
          {
            this.out.print(str4 + "(ptr" + i1 + " == NULL ? NULL : ptr" + i1 + "->ptr)");
          }
          else if (((localAnnotation instanceof ByVal)) || (((localAnnotation instanceof ByRef)) && (paramMethodInformation.parameterTypes[i1] != java.lang.String.class)))
          {
            this.out.print("*" + str4 + "ptr" + i1);
          }
          else if ((localAnnotation instanceof ByPtrPtr))
          {
            this.out.print(str4 + "(arg" + i1 + " == NULL ? NULL : &ptr" + i1 + ")");
          }
          else
          {
            this.out.print(str4 + "ptr" + i1);
          }
        }
      }
      this.out.print(str3);
      if (paramMethodInformation.memberName.length > 2)
        this.out.print(paramMethodInformation.memberName[2]);
    }
    while ((!(getBy(paramMethodInformation.annotations) instanceof ByRef)) || (paramMethodInformation.returnType != java.lang.String.class));
    label667: label1209: label1217: this.out.print(");\n" + str1 + "rptr = rstr.c_str()");
    label1317: label1447: return;
  }

  private void doCallback(Class<?> paramClass, Method paramMethod, java.lang.String paramString, boolean paramBoolean)
  {
    Class localClass = paramMethod.getReturnType();
    Class[] arrayOfClass = paramMethod.getParameterTypes();
    Annotation[] arrayOfAnnotation1 = paramMethod.getAnnotations();
    Annotation[][] arrayOfAnnotation = paramMethod.getParameterAnnotations();
    java.lang.String str1 = getFunctionClassName(paramClass);
    java.lang.String[] arrayOfString1 = getCPPTypeName(paramClass);
    java.lang.String[] arrayOfString2 = arrayOfString1[0].split("\\(");
    java.lang.String[] arrayOfString3 = new java.lang.String[1];
    arrayOfString3[0] = arrayOfString2[1];
    arrayOfString2[1] = getValueTypeName(arrayOfString3);
    java.lang.String str2 = arrayOfString1[1].substring(1);
    this.functionPointers.register("static " + str1 + " " + paramString + "_instance;");
    this.jclassesInit.register(paramClass);
    java.lang.String str19;
    java.lang.String str3;
    label255: PrintWriter localPrintWriter2;
    StringBuilder localStringBuilder2;
    if (this.out2 != null)
    {
      PrintWriter localPrintWriter6 = this.out2;
      StringBuilder localStringBuilder7 = new StringBuilder().append("JNIIMPORT ").append(arrayOfString2[0]);
      if (arrayOfString2.length > 1)
      {
        str19 = arrayOfString2[1];
        localPrintWriter6.println(str19 + paramString + str2 + ";");
      }
    }
    else
    {
      PrintWriter localPrintWriter1 = this.out;
      StringBuilder localStringBuilder1 = new StringBuilder().append("JNIEXPORT ").append(arrayOfString2[0]);
      if (arrayOfString2.length <= 1)
        break label408;
      str3 = arrayOfString2[1];
      localPrintWriter1.println(str3 + paramString + str2 + " {");
      localPrintWriter2 = this.out;
      localStringBuilder2 = new StringBuilder();
      if (localClass == Void.TYPE)
        break label415;
    }
    label408: label415: for (java.lang.String str4 = "    return "; ; str4 = "    ")
    {
      localPrintWriter2.print(str4 + paramString + "_instance(");
      for (int i = 0; i < arrayOfClass.length; i++)
      {
        this.out.print("arg" + i);
        if (i < -1 + arrayOfClass.length)
          this.out.print(", ");
      }
      str19 = "";
      break;
      str3 = "";
      break label255;
    }
    this.out.println(");");
    this.out.println("}");
    if (!paramBoolean)
      return;
    this.out.println(arrayOfString2[0] + str1 + "::operator()" + str2 + " {");
    java.lang.String str5 = "";
    if (localClass != Void.TYPE)
    {
      this.out.println("    " + getJNITypeName(localClass) + " rarg = 0;");
      str5 = "rarg = ";
      if (localClass == java.lang.String.class)
        str5 = str5 + "(jstring)";
    }
    java.lang.String str6 = getCast(arrayOfAnnotation1, localClass);
    Annotation localAnnotation1 = getBy(arrayOfAnnotation1);
    java.lang.String[] arrayOfString4 = getCPPTypeName(localClass);
    java.lang.String str7 = getValueTypeName(arrayOfString4);
    AdapterInformation localAdapterInformation1 = getAdapterInformation(false, str7, arrayOfAnnotation1);
    this.out.println("    jthrowable exc = NULL;");
    this.out.println("    JNIEnv* env;");
    this.out.println("    int attached = JavaCPP_getEnv(&env);");
    this.out.println("    if (attached < 0) {");
    this.out.println("        goto end;");
    this.out.println("    }");
    this.out.println("{");
    if (arrayOfClass.length > 0)
    {
      this.out.println("    jvalue args[" + arrayOfClass.length + "];");
      int k = 0;
      if (k < arrayOfClass.length)
      {
        if (arrayOfClass[k].isPrimitive())
          this.out.println("    args[" + k + "]." + getSignature(arrayOfClass[k]).toLowerCase() + " = (" + getJNITypeName(arrayOfClass[k]) + ")arg" + k + ";");
        while (true)
        {
          k++;
          break;
          Annotation localAnnotation3 = getBy(arrayOfAnnotation[k]);
          java.lang.String[] arrayOfString6 = getCPPTypeName(arrayOfClass[k]);
          java.lang.String str12 = getValueTypeName(arrayOfString6);
          Annotation[] arrayOfAnnotation2 = arrayOfAnnotation[k];
          AdapterInformation localAdapterInformation3 = getAdapterInformation(false, str12, arrayOfAnnotation2);
          int m;
          label1055: java.lang.String str17;
          if (localAdapterInformation3 != null)
          {
            this.usesAdapters = true;
            this.out.println("    " + localAdapterInformation3.name + " adapter" + k + "(arg" + k + ");");
            if (arrayOfClass[k] != java.lang.String.class)
            {
              this.out.println("    jint size" + k + " = (jint)adapter" + k + ".size;");
              this.out.println("    jlong deallocator" + k + " = ptr_to_jlong(&(" + localAdapterInformation3.name + "::deallocate));");
            }
            m = 1;
            if ((Pointer.class.isAssignableFrom(arrayOfClass[k])) || (Buffer.class.isAssignableFrom(arrayOfClass[k])) || ((arrayOfClass[k].isArray()) && (arrayOfClass[k].getComponentType().isPrimitive())))
            {
              if (FunctionPointer.class.isAssignableFrom(arrayOfClass[k]))
              {
                arrayOfString6[0] = (getFunctionClassName(arrayOfClass[k]) + "*");
                arrayOfString6[1] = "";
                str12 = getValueTypeName(arrayOfString6);
              }
              this.out.println("    " + getJNITypeName(arrayOfClass[k]) + " obj" + k + " = NULL;");
              this.out.println("    " + arrayOfString6[0] + " ptr" + k + arrayOfString6[1] + " = NULL;");
              if (!FunctionPointer.class.isAssignableFrom(arrayOfClass[k]))
                break label2132;
              this.out.println("    ptr" + k + " = new (std::nothrow) " + str12 + ";");
              this.out.println("    if (ptr" + k + " != NULL) {");
              this.out.println("        ptr" + k + "->ptr = arg" + k + ";");
              this.out.println("    }");
            }
            label1417: if (!Pointer.class.isAssignableFrom(arrayOfClass[k]))
              break label2772;
            str17 = "    obj" + k + " = env->AllocObject(JavaCPP_getClass(env, " + this.jclasses.register(arrayOfClass[k]) + "));";
            this.jclassesInit.register(arrayOfClass[k]);
            Annotation[] arrayOfAnnotation3 = arrayOfAnnotation[k];
            if ((getAdapterInformation(true, str12, arrayOfAnnotation3) == null) && (!(localAnnotation3 instanceof ByPtrPtr)) && (!(localAnnotation3 instanceof ByPtrRef)))
              break label2650;
            this.out.println(str17);
            label1536: this.out.println("    if (obj" + k + " != NULL) { ");
            if (m == 0)
              break label2724;
            this.out.println("        if (deallocator" + k + " != 0) {");
            this.out.println("            jvalue args[3];");
            this.out.println("            args[0].j = ptr_to_jlong(ptr" + k + ");");
            this.out.println("            args[1].i = size" + k + ";");
            this.out.println("            args[2].j = deallocator" + k + ";");
            this.out.println("            env->CallNonvirtualVoidMethodA(obj" + k + ", JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), JavaCPP_initMID, args);");
            this.out.println("        } else {");
            this.out.println("            env->SetLongField(obj" + k + ", JavaCPP_addressFID, ptr_to_jlong(ptr" + k + "));");
            this.out.println("            env->SetIntField(obj" + k + ", JavaCPP_limitFID, size" + k + ");");
            this.out.println("            env->SetIntField(obj" + k + ", JavaCPP_capacityFID, size" + k + ");");
            this.out.println("        }");
          }
          while (true)
          {
            this.out.println("    }");
            this.out.println("    args[" + k + "].l = obj" + k + ";");
            break;
            if ((!(localAnnotation3 instanceof ByVal)) || (arrayOfClass[k] == Pointer.class))
            {
              boolean bool = FunctionPointer.class.isAssignableFrom(arrayOfClass[k]);
              m = 0;
              if (!bool)
                break label1055;
            }
            this.out.println("    jint size" + k + " = 1;");
            this.out.println("    jlong deallocator" + k + " = ptr_to_jlong(&JavaCPP_" + mangle(arrayOfClass[k].getName()) + "_deallocate);");
            this.deallocators.register(arrayOfClass[k]);
            m = 1;
            break label1055;
            label2132: if (localAdapterInformation3 != null)
            {
              this.out.println("    ptr" + k + " = adapter" + k + ";");
              break label1417;
            }
            if (((localAnnotation3 instanceof ByVal)) && (arrayOfClass[k] != Pointer.class))
            {
              PrintWriter localPrintWriter5 = this.out;
              StringBuilder localStringBuilder6 = new StringBuilder().append("    ptr").append(k);
              if (getNoException(arrayOfClass[k], paramMethod));
              for (java.lang.String str18 = " = new (std::nothrow) "; ; str18 = " = new ")
              {
                localPrintWriter5.println(str18 + str12 + arrayOfString6[1] + "(*(" + arrayOfString6[0] + arrayOfString6[1] + ")&arg" + k + ");");
                break;
              }
            }
            if (((localAnnotation3 instanceof ByVal)) || ((localAnnotation3 instanceof ByRef)))
            {
              this.out.println("    ptr" + k + " = (" + arrayOfString6[0] + arrayOfString6[1] + ")&arg" + k + ";");
              break label1417;
            }
            if ((localAnnotation3 instanceof ByPtrPtr))
            {
              this.out.println("    if (arg" + k + " == NULL) {");
              this.out.println("        JavaCPP_log(\"Pointer address of argument " + k + " is NULL in callback for " + paramClass.getCanonicalName() + ".\");");
              this.out.println("    } else {");
              this.out.println("        ptr" + k + " = (" + arrayOfString6[0] + arrayOfString6[1] + ")*arg" + k + ";");
              this.out.println("    }");
              break label1417;
            }
            this.out.println("    ptr" + k + " = (" + arrayOfString6[0] + arrayOfString6[1] + ")arg" + k + ";");
            break label1417;
            label2650: this.out.println("    if (ptr" + k + " != NULL) { ");
            this.out.println("    " + str17);
            this.out.println("    }");
            break label1536;
            label2724: this.out.println("        env->SetLongField(obj" + k + ", JavaCPP_addressFID, ptr_to_jlong(ptr" + k + "));");
          }
          label2772: if (arrayOfClass[k] == java.lang.String.class)
          {
            PrintWriter localPrintWriter4 = this.out;
            StringBuilder localStringBuilder4 = new StringBuilder().append("    jstring obj").append(k).append(" = (const char*)");
            java.lang.String str15;
            StringBuilder localStringBuilder5;
            if (localAdapterInformation3 != null)
            {
              str15 = "adapter";
              localStringBuilder5 = localStringBuilder4.append(str15).append(k).append(" == NULL ? NULL : env->NewStringUTF((const char*)");
              if (localAdapterInformation3 == null)
                break label2935;
            }
            label2935: for (java.lang.String str16 = "adapter"; ; str16 = "arg")
            {
              localPrintWriter4.println(str16 + k + ");");
              this.out.println("    args[" + k + "].l = obj" + k + ";");
              break;
              str15 = "arg";
              break label2824;
            }
          }
          label2824: if ((arrayOfClass[k].isArray()) && (arrayOfClass[k].getComponentType().isPrimitive()))
          {
            if (localAdapterInformation3 == null)
              this.out.println("    jint size" + k + " = ptr" + k + " != NULL ? 1 : 0;");
            java.lang.String str13 = arrayOfClass[k].getComponentType().getName();
            java.lang.String str14 = Character.toUpperCase(str13.charAt(0)) + str13.substring(1);
            this.out.println("    if (ptr" + k + " != NULL) {");
            this.out.println("        obj" + k + " = env->New" + str14 + "Array(size" + k + ");");
            this.out.println("        env->Set" + str14 + "ArrayRegion(obj" + k + ", 0, size" + k + ", (j" + str13 + "*)ptr" + k + ");");
            this.out.println("    }");
            if (localAdapterInformation3 != null)
            {
              this.out.println("    if (deallocator" + k + " != 0 && ptr" + k + " != NULL) {");
              this.out.println("        (*(void(*)(void*))jlong_to_ptr(deallocator" + k + "))((void*)ptr" + k + ");");
              this.out.println("    }");
            }
          }
          else if (Buffer.class.isAssignableFrom(arrayOfClass[k]))
          {
            if (localAdapterInformation3 == null)
              this.out.println("    jint size" + k + " = ptr" + k + " != NULL ? 1 : 0;");
            this.out.println("    if (ptr" + k + " != NULL) {");
            this.out.println("        obj" + k + " = env->NewDirectByteBuffer(ptr" + k + ", size" + k + ");");
            this.out.println("    }");
          }
          else
          {
            logger.log(Level.WARNING, "Callback \"" + paramMethod + "\" has unsupported parameter type \"" + arrayOfClass[k].getCanonicalName() + "\". Compilation will most likely fail.");
          }
        }
      }
    }
    this.out.println("    if (obj == NULL) {");
    this.out.println("        obj = env->NewGlobalRef(env->AllocObject(JavaCPP_getClass(env, " + this.jclasses.register(paramClass) + ")));");
    this.out.println("        if (obj == NULL) {");
    this.out.println("            JavaCPP_log(\"Error creating global reference of " + paramClass.getCanonicalName() + " instance for callback.\");");
    this.out.println("        } else {");
    this.out.println("            env->SetLongField(obj, JavaCPP_addressFID, ptr_to_jlong(this));");
    this.out.println("        }");
    this.out.println("        ptr = &" + paramString + ";");
    this.out.println("    }");
    this.out.println("    if (mid == NULL) {");
    this.out.println("        mid = env->GetMethodID(JavaCPP_getClass(env, " + this.jclasses.register(paramClass) + "), \"" + paramMethod.getName() + "\", \"(" + getSignature(paramMethod.getParameterTypes()) + ")" + getSignature(paramMethod.getReturnType()) + "\");");
    this.out.println("    }");
    this.out.println("    if (env->IsSameObject(obj, NULL)) {");
    this.out.println("        JavaCPP_log(\"Function pointer object is NULL in callback for " + paramClass.getCanonicalName() + ".\");");
    this.out.println("    } else if (mid == NULL) {");
    this.out.println("        JavaCPP_log(\"Error getting method ID of function caller \\\"" + paramMethod + "\\\" for callback.\");");
    this.out.println("    } else {");
    java.lang.String str8 = "Object";
    if (localClass.isPrimitive())
    {
      java.lang.String str11 = localClass.getName();
      str8 = Character.toUpperCase(str11.charAt(0)) + str11.substring(1);
    }
    PrintWriter localPrintWriter3 = this.out;
    StringBuilder localStringBuilder3 = new StringBuilder().append("        ").append(str5).append("env->Call").append(str8).append("MethodA(obj, mid, ");
    java.lang.String str9;
    int j;
    label4107: Annotation localAnnotation2;
    java.lang.String str10;
    if (arrayOfClass.length == 0)
    {
      str9 = "NULL);";
      localPrintWriter3.println(str9);
      this.out.println("        if ((exc = env->ExceptionOccurred()) != NULL) {");
      this.out.println("            env->ExceptionClear();");
      this.out.println("        }");
      this.out.println("    }");
      j = 0;
      if (j >= arrayOfClass.length)
        break label4805;
      if (Pointer.class.isAssignableFrom(arrayOfClass[j]))
      {
        java.lang.String[] arrayOfString5 = getCPPTypeName(arrayOfClass[j]);
        localAnnotation2 = getBy(arrayOfAnnotation[j]);
        str10 = getCast(arrayOfAnnotation[j], arrayOfClass[j]);
        AdapterInformation localAdapterInformation2 = getAdapterInformation(true, getValueTypeName(arrayOfString5), arrayOfAnnotation[j]);
        if ("void*".equals(arrayOfString5[0]))
          arrayOfString5[0] = "char*";
        if ((localAdapterInformation2 != null) || ((localAnnotation2 instanceof ByPtrPtr)) || ((localAnnotation2 instanceof ByPtrRef)))
        {
          this.out.println("    " + arrayOfString5[0] + " rptr" + j + arrayOfString5[1] + " = (" + arrayOfString5[0] + arrayOfString5[1] + ")jlong_to_ptr(env->GetLongField(obj" + j + ", JavaCPP_addressFID));");
          if (localAdapterInformation2 != null)
            this.out.println("    jint rsize" + j + " = env->GetIntField(obj" + j + ", JavaCPP_limitFID);");
          if (!arrayOfClass[j].isAnnotationPresent(Opaque.class))
          {
            this.out.println("    jint rposition" + j + " = env->GetIntField(obj" + j + ", JavaCPP_positionFID);");
            this.out.println("    rptr" + j + " += rposition" + j + ";");
            if (localAdapterInformation2 != null)
              this.out.println("    rsize" + j + " -= rposition" + j + ";");
          }
          if (localAdapterInformation2 == null)
            break label4628;
          this.out.println("    adapter" + j + ".assign(rptr" + j + ", rsize" + j + ");");
        }
      }
    }
    while (true)
    {
      if (!arrayOfClass[j].isPrimitive())
        this.out.println("    env->DeleteLocalRef(obj" + j + ");");
      j++;
      break label4107;
      str9 = "args);";
      break;
      label4628: if ((localAnnotation2 instanceof ByPtrPtr))
      {
        this.out.println("    if (arg" + j + " != NULL) {");
        this.out.println("        *arg" + j + " = *" + str10 + "&rptr" + j + ";");
        this.out.println("    }");
      }
      else if ((localAnnotation2 instanceof ByPtrRef))
      {
        this.out.println("    arg" + j + " = " + str10 + "rptr" + j + ";");
      }
    }
    label4805: this.out.println("}");
    this.out.println("end:");
    if (localClass != Void.TYPE)
    {
      if ("void*".equals(arrayOfString4[0]))
        arrayOfString4[0] = "char*";
      if (!Pointer.class.isAssignableFrom(localClass))
        break label5201;
      this.out.println("    " + arrayOfString4[0] + " rptr" + arrayOfString4[1] + " = rarg == NULL ? NULL : (" + arrayOfString4[0] + arrayOfString4[1] + ")jlong_to_ptr(env->GetLongField(rarg, JavaCPP_addressFID));");
      if (localAdapterInformation1 != null)
        this.out.println("    jint rsize = rarg == NULL ? 0 : env->GetIntField(rarg, JavaCPP_limitFID);");
      if (!localClass.isAnnotationPresent(Opaque.class))
      {
        this.out.println("    jint rposition = rarg == NULL ? 0 : env->GetIntField(rarg, JavaCPP_positionFID);");
        this.out.println("    rptr += rposition;");
        if (localAdapterInformation1 != null)
          this.out.println("    rsize -= rposition;");
      }
    }
    this.out.println("    if (exc != NULL) {");
    this.out.println("        jclass cls = env->GetObjectClass(exc);");
    this.out.println("        jmethodID mid = env->GetMethodID(cls, \"toString\", \"()Ljava/lang/String;\");");
    this.out.println("        env->DeleteLocalRef(cls);");
    this.out.println("        jstring str = (jstring)env->CallObjectMethod(exc, mid);");
    this.out.println("        env->DeleteLocalRef(exc);");
    this.out.println("        const char *msg = env->GetStringUTFChars(str, NULL);");
    this.out.println("        JavaCPP_exception e(msg);");
    this.out.println("        env->ReleaseStringUTFChars(str, msg);");
    this.out.println("        env->DeleteLocalRef(str);");
    this.out.println("        JavaCPP_detach(attached);");
    this.out.println("        throw e;");
    this.out.println("    } else {");
    this.out.println("        JavaCPP_detach(attached);");
    this.out.println("    }");
    if (localClass != Void.TYPE)
    {
      if (!localClass.isPrimitive())
        break label5411;
      this.out.println("    return " + str6 + "rarg;");
    }
    while (true)
    {
      this.out.println("}");
      return;
      label5201: if (localClass == java.lang.String.class)
      {
        this.out.println("    " + arrayOfString4[0] + " rptr" + arrayOfString4[1] + " = rarg == NULL ? NULL : env->GetStringUTFChars(rarg, NULL);");
        if (localAdapterInformation1 == null)
          break;
        this.out.println("    jint rsize = 0;");
        break;
      }
      if (Buffer.class.isAssignableFrom(localClass))
      {
        this.out.println("    " + arrayOfString4[0] + " rptr" + arrayOfString4[1] + " = rarg == NULL ? NULL : env->GetDirectBufferAddress(rarg);");
        if (localAdapterInformation1 == null)
          break;
        this.out.println("    jint rsize = rarg == NULL ? 0 : env->GetDirectBufferCapacity(rarg);");
        break;
      }
      if (localClass.isPrimitive())
        break;
      logger.log(Level.WARNING, "Callback \"" + paramMethod + "\" has unsupported return type \"" + localClass.getCanonicalName() + "\". Compilation will most likely fail.");
      break;
      label5411: if (localAdapterInformation1 != null)
      {
        this.usesAdapters = true;
        this.out.println("    return " + localAdapterInformation1.name + "(" + str6 + "rptr, rsize);");
      }
      else if (FunctionPointer.class.isAssignableFrom(localClass))
      {
        this.out.println("    return " + str6 + "(rptr == NULL ? NULL : rptr->ptr);");
      }
      else if (((localAnnotation1 instanceof ByVal)) || ((localAnnotation1 instanceof ByRef)))
      {
        this.out.println("    if (rptr == NULL) {");
        this.out.println("        JavaCPP_log(\"Return pointer address is NULL in callback for " + paramClass.getCanonicalName() + ".\");");
        this.out.println("        static " + str7 + " empty" + arrayOfString4[1] + ";");
        this.out.println("        return empty;");
        this.out.println("    } else {");
        this.out.println("        return *" + str6 + "rptr;");
        this.out.println("    }");
      }
      else if ((localAnnotation1 instanceof ByPtrPtr))
      {
        this.out.println("    return " + str6 + "&rptr;");
      }
      else
      {
        this.out.println("    return " + str6 + "rptr;");
      }
    }
  }

  private void doCallbackAllocator(Class paramClass, java.lang.String paramString)
  {
    java.lang.String str = getFunctionClassName(paramClass);
    this.out.println("    obj = env->NewWeakGlobalRef(obj);");
    this.out.println("    if (obj == NULL) {");
    this.out.println("        JavaCPP_log(\"Error creating global reference of " + paramClass.getCanonicalName() + " instance for callback.\");");
    this.out.println("        return;");
    this.out.println("    }");
    this.out.println("    " + str + "* rptr = new (std::nothrow) " + str + ";");
    this.out.println("    if (rptr != NULL) {");
    this.out.println("        rptr->ptr = &" + paramString + ";");
    this.out.println("        rptr->obj = obj;");
    this.out.println("        jvalue args[3];");
    this.out.println("        args[0].j = ptr_to_jlong(rptr);");
    this.out.println("        args[1].i = 1;");
    this.out.println("        args[2].j = ptr_to_jlong(&JavaCPP_" + mangle(paramClass.getName()) + "_deallocate);");
    this.deallocators.register(paramClass);
    this.out.println("        env->CallNonvirtualVoidMethodA(obj, JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), JavaCPP_initMID, args);");
    this.out.println("        " + paramString + "_instance = *rptr;");
    this.out.println("    }");
    this.out.println("}");
  }

  private boolean doClasses(boolean paramBoolean1, boolean paramBoolean2, java.lang.String paramString, Class<?>[] paramArrayOfClass)
  {
    this.out.println("/* DO NOT EDIT THIS FILE - IT IS MACHINE GENERATED */");
    this.out.println();
    if (this.out2 != null)
    {
      this.out2.println("/* DO NOT EDIT THIS FILE - IT IS MACHINE GENERATED */");
      this.out2.println();
    }
    Iterator localIterator1 = this.properties.get("generator.define").iterator();
    while (localIterator1.hasNext())
    {
      java.lang.String str11 = (java.lang.String)localIterator1.next();
      this.out.println("#define " + str11);
    }
    this.out.println();
    this.out.println("#ifdef __APPLE__");
    this.out.println("    #define _JAVASOFT_JNI_MD_H_");
    this.out.println();
    this.out.println("    #define JNIEXPORT __attribute__((visibility(\"default\")))");
    this.out.println("    #define JNIIMPORT");
    this.out.println("    #define JNICALL");
    this.out.println();
    this.out.println("    typedef int jint;");
    this.out.println("    typedef long long jlong;");
    this.out.println("    typedef signed char jbyte;");
    this.out.println("#endif");
    this.out.println("#ifdef _WIN32");
    this.out.println("    #define _JAVASOFT_JNI_MD_H_");
    this.out.println();
    this.out.println("    #define JNIEXPORT __declspec(dllexport)");
    this.out.println("    #define JNIIMPORT __declspec(dllimport)");
    this.out.println("    #define JNICALL __stdcall");
    this.out.println();
    this.out.println("    typedef int jint;");
    this.out.println("    typedef long long jlong;");
    this.out.println("    typedef signed char jbyte;");
    this.out.println("#endif");
    this.out.println("#include <jni.h>");
    if (this.out2 != null)
      this.out2.println("#include <jni.h>");
    this.out.println("#ifdef ANDROID");
    this.out.println("    #include <android/log.h>");
    this.out.println("    #define NewWeakGlobalRef(obj) NewGlobalRef(obj)");
    this.out.println("    #define DeleteWeakGlobalRef(obj) DeleteGlobalRef(obj)");
    this.out.println("#endif");
    this.out.println();
    this.out.println("#include <stddef.h>");
    this.out.println("#ifndef _WIN32");
    this.out.println("    #include <stdint.h>");
    this.out.println("#endif");
    this.out.println("#include <stdio.h>");
    this.out.println("#include <stdlib.h>");
    this.out.println("#include <string.h>");
    this.out.println("#include <exception>");
    this.out.println("#include <new>");
    this.out.println();
    this.out.println("#define jlong_to_ptr(a) ((void*)(uintptr_t)(a))");
    this.out.println("#define ptr_to_jlong(a) ((jlong)(uintptr_t)(a))");
    this.out.println();
    this.out.println("#if defined(_MSC_VER)");
    this.out.println("    #define JavaCPP_noinline __declspec(noinline)");
    this.out.println("    #define JavaCPP_hidden /* hidden by default */");
    this.out.println("#elif defined(__GNUC__)");
    this.out.println("    #define JavaCPP_noinline __attribute__((noinline))");
    this.out.println("    #define JavaCPP_hidden   __attribute__((visibility(\"hidden\")))");
    this.out.println("#else");
    this.out.println("    #define JavaCPP_noinline");
    this.out.println("    #define JavaCPP_hidden");
    this.out.println("#endif");
    this.out.println();
    List[] arrayOfList = new List[2];
    arrayOfList[0] = this.properties.get("generator.include");
    arrayOfList[1] = this.properties.get("generator.cinclude");
    for (int i = 0; i < arrayOfList.length; i++)
      if ((arrayOfList[i] != null) && (arrayOfList[i].size() > 0))
      {
        if (i == 1)
        {
          this.out.println("extern \"C\" {");
          if (this.out2 != null)
          {
            this.out2.println("#ifdef __cplusplus");
            this.out2.println("extern \"C\" {");
            this.out2.println("#endif");
          }
        }
        Iterator localIterator14 = arrayOfList[i].iterator();
        while (localIterator14.hasNext())
        {
          java.lang.String str8 = (java.lang.String)localIterator14.next();
          java.lang.String str9 = "#include ";
          if ((!str8.startsWith("<")) && (!str8.startsWith("\"")))
            str9 = str9 + '"';
          java.lang.String str10 = str9 + str8;
          if ((!str8.endsWith(">")) && (!str8.endsWith("\"")))
            str10 = str10 + '"';
          this.out.println(str10);
          if (this.out2 != null)
            this.out2.println(str10);
        }
        if (i == 1)
        {
          this.out.println("}");
          if (this.out2 != null)
          {
            this.out2.println("#ifdef __cplusplus");
            this.out2.println("}");
            this.out2.println("#endif");
          }
        }
        this.out.println();
      }
    this.out.println("static JavaVM* JavaCPP_vm = NULL;");
    this.out.println("static const char* JavaCPP_classNames[" + this.jclasses.size() + "] = {");
    Iterator localIterator2 = this.jclasses.iterator();
    label1060: LinkedList localLinkedList4;
    for (int j = 0; localIterator2.hasNext(); j = localLinkedList4.size())
    {
      Class localClass5 = (Class)localIterator2.next();
      this.out.print("        \"" + localClass5.getName().replace('.', '/') + "\"");
      if (localIterator2.hasNext())
        this.out.println(",");
      localLinkedList4 = (LinkedList)this.members.get(localClass5);
      if ((localLinkedList4 == null) || (localLinkedList4.size() <= j))
        break label1060;
    }
    this.out.println(" };");
    this.out.println("static jclass JavaCPP_classes[" + this.jclasses.size() + "] = { NULL };");
    this.out.println("static jmethodID JavaCPP_initMID = NULL;");
    this.out.println("static jfieldID JavaCPP_addressFID = NULL;");
    this.out.println("static jfieldID JavaCPP_positionFID = NULL;");
    this.out.println("static jfieldID JavaCPP_limitFID = NULL;");
    this.out.println("static jfieldID JavaCPP_capacityFID = NULL;");
    this.out.println();
    this.out.println("static inline void JavaCPP_log(const char* fmt, ...) {");
    this.out.println("    va_list ap;");
    this.out.println("    va_start(ap, fmt);");
    this.out.println("#ifdef ANDROID");
    this.out.println("    __android_log_vprint(ANDROID_LOG_ERROR, \"javacpp\", fmt, ap);");
    this.out.println("#else");
    this.out.println("    vfprintf(stderr, fmt, ap);");
    this.out.println("    fprintf(stderr, \"\\n\");");
    this.out.println("#endif");
    this.out.println("    va_end(ap);");
    this.out.println("}");
    this.out.println();
    this.out.println("static JavaCPP_noinline jclass JavaCPP_getClass(JNIEnv* env, int i) {");
    this.out.println("    if (JavaCPP_classes[i] == NULL && env->PushLocalFrame(1) == 0) {");
    this.out.println("        jclass cls = env->FindClass(JavaCPP_classNames[i]);");
    this.out.println("        if (cls == NULL || env->ExceptionCheck()) {");
    this.out.println("            JavaCPP_log(\"Error loading class %s.\", JavaCPP_classNames[i]);");
    this.out.println("            return NULL;");
    this.out.println("        }");
    this.out.println("        JavaCPP_classes[i] = (jclass)env->NewWeakGlobalRef(cls);");
    this.out.println("        if (JavaCPP_classes[i] == NULL || env->ExceptionCheck()) {");
    this.out.println("            JavaCPP_log(\"Error creating global reference of class %s.\", JavaCPP_classNames[i]);");
    this.out.println("            return NULL;");
    this.out.println("        }");
    this.out.println("        env->PopLocalFrame(NULL);");
    this.out.println("    }");
    this.out.println("    return JavaCPP_classes[i];");
    this.out.println("}");
    this.out.println();
    this.out.println("class JavaCPP_hidden JavaCPP_exception : public std::exception {");
    this.out.println("public:");
    this.out.println("    JavaCPP_exception(const char* str) throw() {");
    this.out.println("        if (str == NULL) {");
    this.out.println("            strcpy(msg, \"Unknown exception.\");");
    this.out.println("        } else {");
    this.out.println("            strncpy(msg, str, sizeof(msg));");
    this.out.println("            msg[sizeof(msg) - 1] = 0;");
    this.out.println("        }");
    this.out.println("    }");
    this.out.println("    virtual const char* what() const throw() { return msg; }");
    this.out.println("    char msg[1024];");
    this.out.println("};");
    this.out.println();
    if (paramBoolean1)
    {
      this.out.println("static JavaCPP_noinline jthrowable JavaCPP_handleException(JNIEnv* env, int i) {");
      this.out.println("    jstring str = NULL;");
      this.out.println("    try {");
      this.out.println("        throw;");
      this.out.println("    } catch (std::exception& e) {");
      this.out.println("        str = env->NewStringUTF(e.what());");
      this.out.println("    } catch (...) {");
      this.out.println("        str = env->NewStringUTF(\"Unknown exception.\");");
      this.out.println("    }");
      this.out.println("    jclass cls = JavaCPP_getClass(env, i);");
      this.out.println("    jmethodID mid = env->GetMethodID(cls, \"<init>\", \"(Ljava/lang/String;)V\");");
      this.out.println("    if (mid == NULL || env->ExceptionCheck()) {");
      this.out.println("        JavaCPP_log(\"Error getting constructor ID of %s.\", JavaCPP_classNames[i]);");
      this.out.println("        return NULL;");
      this.out.println("    } else {");
      this.out.println("        return (jthrowable)env->NewObject(cls, mid, str);");
      this.out.println("    }");
      this.out.println("}");
      this.out.println();
    }
    if (paramBoolean2)
    {
      this.out.println("#include <vector>");
      this.out.println("template<typename P, typename T = P> class JavaCPP_hidden VectorAdapter {");
      this.out.println("public:");
      this.out.println("    VectorAdapter(const P* ptr, typename std::vector<T>::size_type size) : ptr((P*)ptr), size(size),");
      this.out.println("        vec2(ptr ? std::vector<T>((P*)ptr, (P*)ptr + size) : std::vector<T>()), vec(vec2) { }");
      this.out.println("    VectorAdapter(const std::vector<T>& vec) : ptr(0), size(0), vec2(vec), vec(vec2) { }");
      this.out.println("    VectorAdapter(      std::vector<T>& vec) : ptr(0), size(0), vec(vec) { }");
      this.out.println("    void assign(P* ptr, typename std::vector<T>::size_type size) {");
      this.out.println("        this->ptr = ptr;");
      this.out.println("        this->size = size;");
      this.out.println("        vec.assign(ptr, ptr + size);");
      this.out.println("    }");
      this.out.println("    static void deallocate(P* ptr) { delete[] ptr; }");
      this.out.println("    operator P*() {");
      this.out.println("        if (vec.size() > size) {");
      this.out.println("            ptr = new (std::nothrow) P[vec.size()];");
      this.out.println("        }");
      this.out.println("        if (ptr) {");
      this.out.println("            std::copy(vec.begin(), vec.end(), ptr);");
      this.out.println("        }");
      this.out.println("        size = vec.size();");
      this.out.println("        return ptr;");
      this.out.println("    }");
      this.out.println("    operator const P*()        { return &vec[0]; }");
      this.out.println("    operator std::vector<T>&() { return vec; }");
      this.out.println("    operator std::vector<T>*() { return ptr ? &vec : 0; }");
      this.out.println("    P* ptr;");
      this.out.println("    typename std::vector<T>::size_type size;");
      this.out.println("    std::vector<T> vec2;");
      this.out.println("    std::vector<T>& vec;");
      this.out.println("};");
      this.out.println();
      this.out.println("#include <string>");
      this.out.println("class JavaCPP_hidden StringAdapter {");
      this.out.println("public:");
      this.out.println("    StringAdapter(const          char* ptr, size_t size) : ptr((char*)ptr), size(size),");
      this.out.println("        str2(ptr ? (char*)ptr : \"\"), str(str2) { }");
      this.out.println("    StringAdapter(const signed   char* ptr, size_t size) : ptr((char*)ptr), size(size),");
      this.out.println("        str2(ptr ? (char*)ptr : \"\"), str(str2) { }");
      this.out.println("    StringAdapter(const unsigned char* ptr, size_t size) : ptr((char*)ptr), size(size),");
      this.out.println("        str2(ptr ? (char*)ptr : \"\"), str(str2) { }");
      this.out.println("    StringAdapter(const std::string& str) : ptr(0), size(0), str2(str), str(str2) { }");
      this.out.println("    StringAdapter(      std::string& str) : ptr(0), size(0), str(str) { }");
      this.out.println("    void assign(char* ptr, size_t size) {");
      this.out.println("        this->ptr = ptr;");
      this.out.println("        this->size = size;");
      this.out.println("        str.assign(ptr ? ptr : \"\");");
      this.out.println("    }");
      this.out.println("    static void deallocate(char* ptr) { free(ptr); }");
      this.out.println("    operator char*() {");
      this.out.println("        const char* c_str = str.c_str();");
      this.out.println("        if (ptr == NULL || strcmp(c_str, ptr) != 0) {");
      this.out.println("            ptr = strdup(c_str);");
      this.out.println("        }");
      this.out.println("        size = strlen(c_str) + 1;");
      this.out.println("        return ptr;");
      this.out.println("    }");
      this.out.println("    operator       signed   char*() { return (signed   char*)(operator char*)(); }");
      this.out.println("    operator       unsigned char*() { return (unsigned char*)(operator char*)(); }");
      this.out.println("    operator const          char*() { return                 str.c_str(); }");
      this.out.println("    operator const signed   char*() { return (signed   char*)str.c_str(); }");
      this.out.println("    operator const unsigned char*() { return (unsigned char*)str.c_str(); }");
      this.out.println("    operator         std::string&() { return str; }");
      this.out.println("    operator         std::string*() { return ptr ? &str : 0; }");
      this.out.println("    char* ptr;");
      this.out.println("    size_t size;");
      this.out.println("    std::string str2;");
      this.out.println("    std::string& str;");
      this.out.println("};");
      this.out.println();
    }
    if (!this.functionDefinitions.isEmpty())
    {
      this.out.println("static JavaCPP_noinline void JavaCPP_detach(int detach) {");
      this.out.println("    if (detach > 0 && JavaCPP_vm->DetachCurrentThread() != 0) {");
      this.out.println("        JavaCPP_log(\"Could not detach the JavaVM from the current thread.\");");
      this.out.println("    }");
      this.out.println("}");
      this.out.println();
      this.out.println("static JavaCPP_noinline int JavaCPP_getEnv(JNIEnv** env) {");
      this.out.println("    int attached = 0;");
      this.out.println("    struct {");
      this.out.println("        JNIEnv **env;");
      this.out.println("        operator JNIEnv**() { return env; } // Android JNI");
      this.out.println("        operator void**() { return (void**)env; } // standard JNI");
      this.out.println("    } env2 = { env };");
      this.out.println("    JavaVM *vm = JavaCPP_vm;");
      this.out.println("    if (vm == NULL) {");
      if (this.out2 != null)
      {
        this.out.println("#ifndef ANDROID");
        this.out.println("        int size = 1;");
        this.out.println("        if (JNI_GetCreatedJavaVMs(&vm, 1, &size) != 0 || size == 0) {");
        this.out.println("#endif");
      }
      this.out.println("            JavaCPP_log(\"Could not get any created JavaVM.\");");
      this.out.println("            return -1;");
      if (this.out2 != null)
      {
        this.out.println("#ifndef ANDROID");
        this.out.println("        }");
        this.out.println("#endif");
      }
      this.out.println("    }");
      this.out.println("    if (vm->GetEnv((void**)env, JNI_VERSION_1_6) != JNI_OK) {");
      this.out.println("        if (vm->AttachCurrentThread(env2, NULL) != 0) {");
      this.out.println("            JavaCPP_log(\"Could not attach the JavaVM to the current thread.\");");
      this.out.println("            return -1;");
      this.out.println("        }");
      this.out.println("        attached = 1;");
      this.out.println("    }");
      this.out.println("    if (JavaCPP_vm == NULL) {");
      this.out.println("        if (JNI_OnLoad(vm, NULL) < 0) {");
      this.out.println("            JavaCPP_detach(attached);");
      this.out.println("            return -1;");
      this.out.println("        }");
      this.out.println("    }");
      this.out.println("    return attached;");
      this.out.println("}");
      this.out.println();
    }
    Iterator localIterator3 = this.functionDefinitions.iterator();
    while (localIterator3.hasNext())
    {
      java.lang.String str7 = (java.lang.String)localIterator3.next();
      this.out.println(str7);
    }
    this.out.println();
    Iterator localIterator4 = this.functionPointers.iterator();
    while (localIterator4.hasNext())
    {
      java.lang.String str6 = (java.lang.String)localIterator4.next();
      this.out.println(str6);
    }
    this.out.println();
    Iterator localIterator5 = this.deallocators.iterator();
    while (localIterator5.hasNext())
    {
      Class localClass4 = (Class)localIterator5.next();
      java.lang.String str4 = "JavaCPP_" + mangle(localClass4.getName());
      this.out.print("static void " + str4 + "_deallocate(");
      if (FunctionPointer.class.isAssignableFrom(localClass4))
      {
        java.lang.String str5 = getFunctionClassName(localClass4);
        this.out.println(str5 + "* p) { JNIEnv *e; int a = JavaCPP_getEnv(&e); if (a >= 0) e->DeleteWeakGlobalRef(p->obj); delete p; JavaCPP_detach(a); }");
      }
      else
      {
        java.lang.String[] arrayOfString2 = getCPPTypeName(localClass4);
        this.out.println(arrayOfString2[0] + " p" + arrayOfString2[1] + ") { delete p; }");
      }
    }
    Iterator localIterator6 = this.arrayDeallocators.iterator();
    while (localIterator6.hasNext())
    {
      Class localClass3 = (Class)localIterator6.next();
      java.lang.String str3 = "JavaCPP_" + mangle(localClass3.getName());
      java.lang.String[] arrayOfString1 = getCPPTypeName(localClass3);
      this.out.println("static void " + str3 + "_deallocateArray(" + arrayOfString1[0] + " p" + arrayOfString1[1] + ") { delete[] p; }");
    }
    this.out.println();
    this.out.println("extern \"C\" {");
    if (this.out2 != null)
    {
      this.out2.println();
      this.out2.println("#ifdef __cplusplus");
      this.out2.println("extern \"C\" {");
      this.out2.println("#endif");
      this.out2.println("JNIIMPORT int JavaCPP_init(int argc, const char *argv[]);");
      this.out.println();
      this.out.println("JNIEXPORT int JavaCPP_init(int argc, const char *argv[]) {");
      this.out.println("#ifdef ANDROID");
      this.out.println("    return JNI_OK;");
      this.out.println("#else");
      this.out.println("    JavaVM *vm;");
      this.out.println("    JNIEnv *env;");
      this.out.println("    int nOptions = 1 + (argc > 255 ? 255 : argc);");
      this.out.println("    JavaVMOption options[256] = { { NULL } };");
      this.out.println("    options[0].optionString = (char*)\"-Djava.class.path=" + paramString.replace('\\', '/') + "\";");
      this.out.println("    for (int i = 1; i < nOptions && argv != NULL; i++) {");
      this.out.println("        options[i].optionString = (char*)argv[i - 1];");
      this.out.println("    }");
      this.out.println("    JavaVMInitArgs vm_args = { JNI_VERSION_1_6, nOptions, options };");
      this.out.println("    return JNI_CreateJavaVM(&vm, (void **)&env, &vm_args);");
      this.out.println("#endif");
      this.out.println("}");
    }
    this.out.println();
    this.out.println("JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {");
    this.out.println("    JNIEnv* env;");
    this.out.println("    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) {");
    this.out.println("        JavaCPP_log(\"Could not get JNIEnv for JNI_VERSION_1_6 inside JNI_OnLoad().\");");
    this.out.println("        return JNI_ERR;");
    this.out.println("    }");
    this.out.println("    if (JavaCPP_vm == vm) {");
    this.out.println("        return env->GetVersion();");
    this.out.println("    }");
    this.out.println("    JavaCPP_vm = vm;");
    this.out.println("    const char* members[" + this.jclasses.size() + "][" + j + "] = {");
    Iterator localIterator7 = this.jclasses.iterator();
    while (localIterator7.hasNext())
    {
      this.out.print("            { ");
      LinkedList localLinkedList3 = (LinkedList)this.members.get(localIterator7.next());
      Iterator localIterator13;
      if (localLinkedList3 == null)
        localIterator13 = null;
      while ((localIterator13 != null) && (localIterator13.hasNext()))
      {
        this.out.print("\"" + (java.lang.String)localIterator13.next() + "\"");
        if (localIterator13.hasNext())
        {
          this.out.print(", ");
          continue;
          localIterator13 = localLinkedList3.iterator();
        }
      }
      this.out.print(" }");
      if (localIterator7.hasNext())
        this.out.println(",");
    }
    this.out.println(" };");
    this.out.println("    int offsets[" + this.jclasses.size() + "][" + j + "] = {");
    Iterator localIterator8 = this.jclasses.iterator();
    while (localIterator8.hasNext())
    {
      this.out.print("            { ");
      Class localClass2 = (Class)localIterator8.next();
      LinkedList localLinkedList2 = (LinkedList)this.members.get(localClass2);
      Iterator localIterator12;
      if (localLinkedList2 == null)
        localIterator12 = null;
      label4350: 
      while ((localIterator12 != null) && (localIterator12.hasNext()))
      {
        java.lang.String str1 = getValueTypeName(getCPPTypeName(localClass2));
        java.lang.String str2 = (java.lang.String)localIterator12.next();
        if ("sizeof".equals(str2))
        {
          if ("void".equals(str1))
            str1 = "void*";
          this.out.print("sizeof(" + str1 + ")");
        }
        while (true)
        {
          if (!localIterator12.hasNext())
            break label4350;
          this.out.print(", ");
          break;
          localIterator12 = localLinkedList2.iterator();
          break;
          this.out.print("offsetof(" + str1 + "," + str2 + ")");
        }
      }
      this.out.print(" }");
      if (localIterator8.hasNext())
        this.out.println(",");
    }
    this.out.println(" };");
    this.out.print("    int memberOffsetSizes[" + this.jclasses.size() + "] = { ");
    Iterator localIterator9 = this.jclasses.iterator();
    if (localIterator9.hasNext())
    {
      LinkedList localLinkedList1 = (LinkedList)this.members.get(localIterator9.next());
      PrintWriter localPrintWriter = this.out;
      if (localLinkedList1 == null);
      for (int n = 0; ; n = localLinkedList1.size())
      {
        localPrintWriter.print(n);
        if (!localIterator9.hasNext())
          break;
        this.out.print(", ");
        break;
      }
    }
    this.out.println(" };");
    this.out.println("    jmethodID putMemberOffsetMID = env->GetStaticMethodID(JavaCPP_getClass(env, " + this.jclasses.register(Loader.class) + "), \"putMemberOffset\", \"(Ljava/lang/String;Ljava/lang/String;I)V\");");
    this.out.println("    if (putMemberOffsetMID == NULL || env->ExceptionCheck()) {");
    this.out.println("        JavaCPP_log(\"Error getting method ID of Loader.putMemberOffset().\");");
    this.out.println("        return JNI_ERR;");
    this.out.println("    }");
    this.out.println("    for (int i = 0; i < " + this.jclasses.size() + " && !env->ExceptionCheck(); i++) {");
    this.out.println("        for (int j = 0; j < memberOffsetSizes[i] && !env->ExceptionCheck(); j++) {");
    this.out.println("            if (env->PushLocalFrame(2) == 0) {");
    this.out.println("                jvalue args[3];");
    this.out.println("                args[0].l = env->NewStringUTF(JavaCPP_classNames[i]);");
    this.out.println("                args[1].l = env->NewStringUTF(members[i][j]);");
    this.out.println("                args[2].i = offsets[i][j];");
    this.out.println("                env->CallStaticVoidMethodA(JavaCPP_getClass(env, " + this.jclasses.register(Loader.class) + "), putMemberOffsetMID, args);");
    this.out.println("                env->PopLocalFrame(NULL);");
    this.out.println("            }");
    this.out.println("        }");
    this.out.println("    }");
    this.out.println("    JavaCPP_initMID = env->GetMethodID(JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), \"init\", \"(JIJ)V\");");
    this.out.println("    if (JavaCPP_initMID == NULL || env->ExceptionCheck()) {");
    this.out.println("        JavaCPP_log(\"Error getting method ID of Pointer.init().\");");
    this.out.println("        return JNI_ERR;");
    this.out.println("    }");
    this.out.println("    JavaCPP_addressFID = env->GetFieldID(JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), \"address\", \"J\");");
    this.out.println("    if (JavaCPP_addressFID == NULL || env->ExceptionCheck()) {");
    this.out.println("        JavaCPP_log(\"Error getting field ID of Pointer.address.\");");
    this.out.println("        return JNI_ERR;");
    this.out.println("    }");
    this.out.println("    JavaCPP_positionFID = env->GetFieldID(JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), \"position\", \"I\");");
    this.out.println("    if (JavaCPP_positionFID == NULL || env->ExceptionCheck()) {");
    this.out.println("        JavaCPP_log(\"Error getting field ID of Pointer.position.\");");
    this.out.println("        return JNI_ERR;");
    this.out.println("    }");
    this.out.println("    JavaCPP_limitFID = env->GetFieldID(JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), \"limit\", \"I\");");
    this.out.println("    if (JavaCPP_limitFID == NULL || env->ExceptionCheck()) {");
    this.out.println("        JavaCPP_log(\"Error getting field ID of Pointer.limit.\");");
    this.out.println("        return JNI_ERR;");
    this.out.println("    }");
    this.out.println("    JavaCPP_capacityFID = env->GetFieldID(JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), \"capacity\", \"I\");");
    this.out.println("    if (JavaCPP_capacityFID == NULL || env->ExceptionCheck()) {");
    this.out.println("        JavaCPP_log(\"Error getting field ID of Pointer.capacity.\");");
    this.out.println("        return JNI_ERR;");
    this.out.println("    }");
    Iterator localIterator10 = this.jclassesInit.iterator();
    while (localIterator10.hasNext())
    {
      Class localClass1 = (Class)localIterator10.next();
      if (localClass1 != Pointer.class)
      {
        this.out.println("    if (JavaCPP_getClass(env, " + this.jclasses.indexOf(localClass1) + ") == NULL) {");
        this.out.println("        return JNI_ERR;");
        this.out.println("    }");
      }
    }
    this.out.println("    return env->GetVersion();");
    this.out.println("}");
    this.out.println();
    if (this.out2 != null)
    {
      this.out2.println("JNIIMPORT int JavaCPP_uninit();");
      this.out2.println();
      this.out.println("JNIEXPORT int JavaCPP_uninit() {");
      this.out.println("#ifdef ANDROID");
      this.out.println("    return JNI_OK;");
      this.out.println("#else");
      this.out.println("    JavaVM *vm = JavaCPP_vm;");
      this.out.println("    JNI_OnUnload(JavaCPP_vm, NULL);");
      this.out.println("    return vm->DestroyJavaVM();");
      this.out.println("#endif");
      this.out.println("}");
    }
    this.out.println();
    this.out.println("JNIEXPORT void JNICALL JNI_OnUnload(JavaVM* vm, void* reserved) {");
    this.out.println("    JNIEnv* env;");
    this.out.println("    if (vm->GetEnv((void**)&env, JNI_VERSION_1_6) != JNI_OK) {");
    this.out.println("        JavaCPP_log(\"Could not get JNIEnv for JNI_VERSION_1_6 inside JNI_OnUnLoad().\");");
    this.out.println("        return;");
    this.out.println("    }");
    this.out.println("    for (int i = 0; i < " + this.jclasses.size() + "; i++) {");
    this.out.println("        env->DeleteWeakGlobalRef(JavaCPP_classes[i]);");
    this.out.println("        JavaCPP_classes[i] = NULL;");
    this.out.println("    }");
    this.out.println("    JavaCPP_vm = NULL;");
    this.out.println("}");
    this.out.println();
    Iterator localIterator11 = baseClasses.iterator();
    while (localIterator11.hasNext())
      doMethods((Class)localIterator11.next());
    boolean bool1 = false;
    int k = paramArrayOfClass.length;
    int m = 0;
    while (true)
      if (m < k)
      {
        Class<?> localClass = paramArrayOfClass[m];
        try
        {
          boolean bool2 = doMethods(localClass);
          bool1 |= bool2;
          m++;
        }
        catch (NoClassDefFoundError localNoClassDefFoundError)
        {
          while (true)
            logger.log(Level.WARNING, "Could not generate code for class " + localClass.getCanonicalName() + ": " + localNoClassDefFoundError);
        }
      }
    this.out.println("}");
    this.out.println();
    if (this.out2 != null)
    {
      this.out2.println("#ifdef __cplusplus");
      this.out2.println("}");
      this.out2.println("#endif");
    }
    return bool1;
  }

  private boolean doMethods(Class<?> paramClass)
  {
    if (!checkPlatform(paramClass))
      return false;
    LinkedList localLinkedList = (LinkedList)this.members.get(paramClass);
    if ((!paramClass.isAnnotationPresent(Opaque.class)) && (!FunctionPointer.class.isAssignableFrom(paramClass)))
    {
      if (localLinkedList == null)
      {
        HashMap localHashMap = this.members;
        localLinkedList = new LinkedList();
        localHashMap.put(paramClass, localLinkedList);
      }
      if (!localLinkedList.contains("sizeof"))
        localLinkedList.add("sizeof");
    }
    boolean bool1 = false;
    Class[] arrayOfClass = paramClass.getDeclaredClasses();
    for (int i = 0; i < arrayOfClass.length; i++)
      if ((Pointer.class.isAssignableFrom(arrayOfClass[i])) || (Pointer.Deallocator.class.isAssignableFrom(arrayOfClass[i])))
        bool1 |= doMethods(arrayOfClass[i]);
    Method[] arrayOfMethod = paramClass.getDeclaredMethods();
    boolean[] arrayOfBoolean = new boolean[arrayOfMethod.length];
    Method localMethod = getFunctionMethod(paramClass, arrayOfBoolean);
    if (localMethod != null)
    {
      java.lang.String[] arrayOfString2 = getCPPTypeName(paramClass);
      java.lang.String[] arrayOfString3 = arrayOfString2[0].split("\\(");
      java.lang.String[] arrayOfString4 = new java.lang.String[1];
      arrayOfString4[0] = arrayOfString3[1];
      arrayOfString3[1] = getValueTypeName(arrayOfString4);
      java.lang.String str5 = arrayOfString2[1].substring(1);
      java.lang.String str6 = getFunctionClassName(paramClass);
      this.functionDefinitions.register("struct JavaCPP_hidden " + str6 + " {\n" + "    " + str6 + "() : ptr(NULL), obj(NULL) { }\n" + "    " + arrayOfString3[0] + "operator()" + str5 + ";\n" + "    " + arrayOfString2[0] + "ptr" + arrayOfString2[1] + ";\n" + "    jobject obj; static jmethodID mid;\n" + "};\n" + "jmethodID " + str6 + "::mid = NULL;");
    }
    boolean bool2 = true;
    int j = 0;
    if (j < arrayOfMethod.length)
    {
      java.lang.String str1 = mangle(paramClass.getName()) + "_" + mangle(arrayOfMethod[j].getName());
      if (!checkPlatform((Platform)arrayOfMethod[j].getAnnotation(Platform.class)));
      MethodInformation localMethodInformation;
      while (true)
      {
        j++;
        break;
        localMethodInformation = getMethodInformation(arrayOfMethod[j]);
        java.lang.String str2 = "JavaCPP_" + str1 + "_callback";
        if ((arrayOfBoolean[j] != 0) && (localMethod == null))
        {
          logger.log(Level.WARNING, "No callback method call() or apply() has been not declared in \"" + paramClass.getCanonicalName() + "\". No code will be generated for callback allocator.");
        }
        else
        {
          if ((arrayOfBoolean[j] != 0) || ((arrayOfMethod[j].equals(localMethod)) && (localMethodInformation == null)))
          {
            Name localName = (Name)arrayOfMethod[j].getAnnotation(Name.class);
            if ((localName != null) && (localName.value().length > 0) && (localName.value()[0].length() > 0))
              str2 = localName.value()[0];
            doCallback(paramClass, localMethod, str2, bool2);
            bool2 = false;
            bool1 = true;
          }
          if (localMethodInformation != null)
          {
            if (((localMethodInformation.memberGetter) || (localMethodInformation.memberSetter)) && (!localMethodInformation.noOffset) && (localLinkedList != null) && (!Modifier.isStatic(localMethodInformation.modifiers)) && (!localLinkedList.contains(localMethodInformation.memberName[0])))
              localLinkedList.add(localMethodInformation.memberName[0]);
            bool1 = true;
            this.out.print("JNIEXPORT " + getJNITypeName(localMethodInformation.returnType) + " JNICALL Java_" + str1);
            if (localMethodInformation.overloaded)
              this.out.print("__" + mangle(getSignature(localMethodInformation.parameterTypes)));
            if (Modifier.isStatic(localMethodInformation.modifiers))
              this.out.print("(JNIEnv* env, jclass cls");
            while (true)
            {
              for (int k = 0; k < localMethodInformation.parameterTypes.length; k++)
                this.out.print(", " + getJNITypeName(localMethodInformation.parameterTypes[k]) + " arg" + k);
              this.out.print("(JNIEnv* env, jobject obj");
            }
            this.out.println(") {");
            if (arrayOfBoolean[j] == 0)
              break label941;
            doCallbackAllocator(paramClass, str2);
          }
        }
      }
      label941: java.lang.String[] arrayOfString1;
      label1002: java.lang.String str3;
      label1159: PrintWriter localPrintWriter2;
      StringBuilder localStringBuilder2;
      if ((!Modifier.isStatic(localMethodInformation.modifiers)) && (!localMethodInformation.allocator) && (!localMethodInformation.arrayAllocator) && (!localMethodInformation.deallocator))
      {
        arrayOfString1 = getCPPTypeName(paramClass);
        if (!"void*".equals(arrayOfString1[0]))
          break label1467;
        arrayOfString1[0] = "char*";
        this.out.println("    " + arrayOfString1[0] + " ptr" + arrayOfString1[1] + " = (" + arrayOfString1[0] + arrayOfString1[1] + ")jlong_to_ptr(env->GetLongField(obj, JavaCPP_addressFID));");
        this.out.println("    if (ptr == NULL) {");
        this.out.println("        env->ThrowNew(JavaCPP_getClass(env, " + this.jclasses.register(NullPointerException.class) + "), \"This pointer address is NULL.\");");
        PrintWriter localPrintWriter1 = this.out;
        StringBuilder localStringBuilder1 = new StringBuilder().append("        return");
        if (localMethodInformation.returnType != Void.TYPE)
          break label1514;
        str3 = ";";
        localPrintWriter1.println(str3);
        this.out.println("    }");
        if (FunctionPointer.class.isAssignableFrom(paramClass))
        {
          this.out.println("    if (ptr->ptr == NULL) {");
          this.out.println("        env->ThrowNew(JavaCPP_getClass(env, " + this.jclasses.register(NullPointerException.class) + "), \"This function pointer address is NULL.\");");
          localPrintWriter2 = this.out;
          localStringBuilder2 = new StringBuilder().append("        return");
          if (localMethodInformation.returnType != Void.TYPE)
            break label1522;
        }
      }
      label1467: label1514: label1522: for (java.lang.String str4 = ";"; ; str4 = " 0;")
      {
        localPrintWriter2.println(str4);
        this.out.println("    }");
        if (!paramClass.isAnnotationPresent(Opaque.class))
        {
          this.out.println("    jint position = env->GetIntField(obj, JavaCPP_positionFID);");
          this.out.println("    ptr += position;");
          if (localMethodInformation.bufferGetter)
          {
            this.out.println("    jint size = env->GetIntField(obj, JavaCPP_limitFID);");
            this.out.println("    size -= position;");
          }
        }
        doParametersBefore(localMethodInformation);
        doCall(localMethodInformation, doReturnBefore(localMethodInformation));
        doReturnAfter(localMethodInformation);
        doParametersAfter(localMethodInformation);
        if (localMethodInformation.throwsException != null)
        {
          this.out.println("    if (exc != NULL) {");
          this.out.println("        env->Throw(exc);");
          this.out.println("    }");
        }
        if (localMethodInformation.returnType != Void.TYPE)
          this.out.println("    return rarg;");
        this.out.println("}");
        break;
        if (!FunctionPointer.class.isAssignableFrom(paramClass))
          break label1002;
        arrayOfString1[0] = (getFunctionClassName(paramClass) + "*");
        arrayOfString1[1] = "";
        break label1002;
        str3 = " 0;";
        break label1159;
      }
    }
    this.out.println();
    return bool1;
  }

  private void doParametersAfter(MethodInformation paramMethodInformation)
  {
    if (paramMethodInformation.throwsException != null)
    {
      this.mayThrowExceptions = true;
      this.out.println("    } catch (...) {");
      this.out.println("        exc = JavaCPP_handleException(env, " + this.jclasses.register(paramMethodInformation.throwsException) + ");");
      this.out.println("    }");
      this.out.println();
    }
    int i = 0;
    if (i < paramMethodInformation.parameterTypes.length)
    {
      if (paramMethodInformation.parameterRaw[i] != 0);
      while (true)
      {
        i++;
        break;
        Annotation localAnnotation = getParameterBy(paramMethodInformation, i);
        java.lang.String str1 = getParameterCast(paramMethodInformation, i);
        java.lang.String[] arrayOfString = getCastedCPPTypeName(paramMethodInformation.parameterAnnotations[i], paramMethodInformation.parameterTypes[i]);
        AdapterInformation localAdapterInformation = getParameterAdapterInformation(true, paramMethodInformation, i);
        if ("void*".equals(arrayOfString[0]))
          arrayOfString[0] = "char*";
        if (Pointer.class.isAssignableFrom(paramMethodInformation.parameterTypes[i]))
        {
          if (localAdapterInformation != null)
          {
            int j = 0;
            label188: PrintWriter localPrintWriter;
            StringBuilder localStringBuilder;
            if (j < localAdapterInformation.argc)
            {
              this.out.println("    " + arrayOfString[0] + " rptr" + (i + j) + arrayOfString[1] + " = " + str1 + "adapter" + i + ";");
              localPrintWriter = this.out;
              localStringBuilder = new StringBuilder().append("    jint rsize").append(i + j).append(" = (jint)adapter").append(i).append(".size");
              if (j <= 0)
                break label677;
            }
            label677: for (java.lang.String str4 = j + 1 + ";"; ; str4 = ";")
            {
              localPrintWriter.println(str4);
              this.out.println("    if (rptr" + (i + j) + " != " + str1 + "ptr" + (i + j) + ") {");
              this.out.println("        jvalue args[3];");
              this.out.println("        args[0].j = ptr_to_jlong(rptr" + (i + j) + ");");
              this.out.println("        args[1].i = rsize" + (i + j) + ";");
              this.out.println("        args[2].j = ptr_to_jlong(&(" + localAdapterInformation.name + "::deallocate));");
              this.out.println("        env->CallNonvirtualVoidMethodA(arg" + i + ", JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), JavaCPP_initMID, args);");
              this.out.println("    } else {");
              this.out.println("        env->SetIntField(arg" + i + ", JavaCPP_limitFID, rsize" + (i + j) + " + position" + (i + j) + ");");
              this.out.println("    }");
              j++;
              break label188;
              break;
            }
          }
          if ((((localAnnotation instanceof ByPtrPtr)) || ((localAnnotation instanceof ByPtrRef))) && (!paramMethodInformation.valueSetter) && (!paramMethodInformation.memberSetter))
          {
            if (!paramMethodInformation.parameterTypes[i].isAnnotationPresent(Opaque.class))
              this.out.println("    ptr" + i + " -= position" + i + ";");
            this.out.println("    if (arg" + i + " != NULL) env->SetLongField(arg" + i + ", JavaCPP_addressFID, ptr_to_jlong(ptr" + i + "));");
          }
        }
        else if (paramMethodInformation.parameterTypes[i] == java.lang.String.class)
        {
          this.out.println("    if (arg" + i + " != NULL) env->ReleaseStringUTFChars(arg" + i + ", ptr" + i + ");");
        }
        else if ((paramMethodInformation.parameterTypes[i].isArray()) && (paramMethodInformation.parameterTypes[i].getComponentType().isPrimitive()))
        {
          this.out.print("    if (arg" + i + " != NULL) ");
          if ((paramMethodInformation.valueGetter) || (paramMethodInformation.valueSetter) || (paramMethodInformation.memberGetter) || (paramMethodInformation.memberSetter))
          {
            this.out.println("env->ReleasePrimitiveArrayCritical(arg" + i + ", ptr" + i + ", 0);");
          }
          else
          {
            java.lang.String str2 = paramMethodInformation.parameterTypes[i].getComponentType().getName();
            java.lang.String str3 = Character.toUpperCase(str2.charAt(0)) + str2.substring(1);
            this.out.println("env->Release" + str3 + "ArrayElements(arg" + i + ", (j" + str2 + "*)ptr" + i + ", 0);");
          }
        }
      }
    }
  }

  private void doParametersBefore(MethodInformation paramMethodInformation)
  {
    java.lang.String str1 = "";
    Object localObject = null;
    int i = 0;
    while (i < paramMethodInformation.parameterTypes.length)
    {
      Annotation localAnnotation;
      java.lang.String str2;
      java.lang.String[] arrayOfString;
      AdapterInformation localAdapterInformation;
      if (!paramMethodInformation.parameterTypes[i].isPrimitive())
      {
        localAnnotation = getParameterBy(paramMethodInformation, i);
        str2 = getParameterCast(paramMethodInformation, i);
        arrayOfString = getCPPTypeName(paramMethodInformation.parameterTypes[i]);
        localAdapterInformation = getParameterAdapterInformation(false, paramMethodInformation, i);
        if (FunctionPointer.class.isAssignableFrom(paramMethodInformation.parameterTypes[i]))
        {
          if (paramMethodInformation.parameterTypes[i] == FunctionPointer.class)
            logger.log(Level.WARNING, "Method \"" + paramMethodInformation.method + "\" has an abstract FunctionPointer parameter, " + "but a concrete subclass is required. Compilation will most likely fail.");
          arrayOfString[0] = (getFunctionClassName(paramMethodInformation.parameterTypes[i]) + "*");
          arrayOfString[1] = "";
        }
        if ((arrayOfString[0].length() == 0) || (paramMethodInformation.parameterRaw[i] != 0))
        {
          paramMethodInformation.parameterRaw[i] = true;
          arrayOfString[0] = getJNITypeName(paramMethodInformation.parameterTypes[i]);
          this.out.println("    " + arrayOfString[0] + " ptr" + i + " = arg" + i + ";");
        }
      }
      else
      {
        i++;
        continue;
      }
      if ("void*".equals(arrayOfString[0]))
        arrayOfString[0] = "char*";
      this.out.print("    " + arrayOfString[0] + " ptr" + i + arrayOfString[1] + " = ");
      java.lang.String str5;
      if (Pointer.class.isAssignableFrom(paramMethodInformation.parameterTypes[i]))
      {
        this.out.println("arg" + i + " == NULL ? NULL : (" + arrayOfString[0] + arrayOfString[1] + ")jlong_to_ptr(env->GetLongField(arg" + i + ", JavaCPP_addressFID));");
        if (((i == 0) && (FunctionPointer.class.isAssignableFrom(paramMethodInformation.cls)) && (paramMethodInformation.cls.isAnnotationPresent(Namespace.class))) || ((localAnnotation instanceof ByVal)) || ((localAnnotation instanceof ByRef)))
        {
          this.out.println("    if (ptr" + i + " == NULL) {");
          this.out.println("        env->ThrowNew(JavaCPP_getClass(env, " + this.jclasses.register(NullPointerException.class) + "), \"Pointer address of argument " + i + " is NULL.\");");
          PrintWriter localPrintWriter = this.out;
          StringBuilder localStringBuilder = new StringBuilder().append("        return");
          if (paramMethodInformation.returnType == Void.TYPE)
          {
            str5 = ";";
            label607: localPrintWriter.println(str5);
            this.out.println("    }");
          }
        }
        else
        {
          if ((localAdapterInformation != null) || (localObject != null))
            this.out.println("    jint size" + i + " = arg" + i + " == NULL ? 0 : env->GetIntField(arg" + i + ", JavaCPP_limitFID);");
          if (!paramMethodInformation.parameterTypes[i].isAnnotationPresent(Opaque.class))
          {
            this.out.println("    jint position" + i + " = arg" + i + " == NULL ? 0 : env->GetIntField(arg" + i + ", JavaCPP_positionFID);");
            this.out.println("    ptr" + i + " += position" + i + ";");
            if ((localAdapterInformation != null) || (localObject != null))
              this.out.println("    size" + i + " -= position" + i + ";");
          }
        }
      }
      while (true)
      {
        if (localAdapterInformation != null)
        {
          this.usesAdapters = true;
          str1 = "    " + localAdapterInformation.name + " adapter" + i + "(";
          localObject = localAdapterInformation;
        }
        if (localObject != null)
        {
          if (!FunctionPointer.class.isAssignableFrom(paramMethodInformation.cls))
            str1 = str1 + str2;
          str1 = str1 + "ptr" + i + ", size" + i;
          int j = -1 + localObject.argc;
          localObject.argc = j;
          if (j > 0)
            str1 = str1 + ", ";
        }
        if ((localObject == null) || (localObject.argc > 0))
          break;
        this.out.println(str1 + ");");
        localObject = null;
        break;
        str5 = " 0;";
        break label607;
        if (paramMethodInformation.parameterTypes[i] == java.lang.String.class)
        {
          this.out.println("arg" + i + " == NULL ? NULL : env->GetStringUTFChars(arg" + i + ", NULL);");
          if ((localAdapterInformation != null) || (localObject != null))
            this.out.println("    jint size" + i + " = 0;");
        }
        else if ((paramMethodInformation.parameterTypes[i].isArray()) && (paramMethodInformation.parameterTypes[i].getComponentType().isPrimitive()))
        {
          this.out.print("arg" + i + " == NULL ? NULL : ");
          java.lang.String str3 = paramMethodInformation.parameterTypes[i].getComponentType().getName();
          if ((paramMethodInformation.valueGetter) || (paramMethodInformation.valueSetter) || (paramMethodInformation.memberGetter) || (paramMethodInformation.memberSetter))
            this.out.println("(j" + str3 + "*)env->GetPrimitiveArrayCritical(arg" + i + ", NULL);");
          while (true)
          {
            if ((localAdapterInformation == null) && (localObject == null))
              break label1484;
            this.out.println("    jint size" + i + " = arg" + i + " == NULL ? 0 : env->GetArrayLength(arg" + i + ");");
            break;
            java.lang.String str4 = Character.toUpperCase(str3.charAt(0)) + str3.substring(1);
            this.out.println("env->Get" + str4 + "ArrayElements(arg" + i + ", NULL);");
          }
        }
        else
        {
          label1484: if (Buffer.class.isAssignableFrom(paramMethodInformation.parameterTypes[i]))
          {
            this.out.println("arg" + i + " == NULL ? NULL : (" + arrayOfString[0] + arrayOfString[1] + ")env->GetDirectBufferAddress(arg" + i + ");");
            if ((localAdapterInformation != null) || (localObject != null))
              this.out.println("    jint size" + i + " = arg" + i + " == NULL ? 0 : env->GetDirectBufferCapacity(arg" + i + ");");
          }
          else
          {
            this.out.println("arg" + i + ";");
            logger.log(Level.WARNING, "Method \"" + paramMethodInformation.method + "\" has an unsupported parameter of type \"" + paramMethodInformation.parameterTypes[i].getCanonicalName() + "\". Compilation will most likely fail.");
          }
        }
      }
    }
  }

  private void doReturnAfter(MethodInformation paramMethodInformation)
  {
    java.lang.String str1;
    Annotation localAnnotation;
    AdapterInformation localAdapterInformation;
    java.lang.String str2;
    label56: java.lang.String str7;
    label158: label228: int k;
    label268: int n;
    if (paramMethodInformation.throwsException != null)
    {
      str1 = "        ";
      java.lang.String[] arrayOfString = getCastedCPPTypeName(paramMethodInformation.annotations, paramMethodInformation.returnType);
      localAnnotation = getBy(paramMethodInformation.annotations);
      localAdapterInformation = getAdapterInformation(false, getValueTypeName(arrayOfString), paramMethodInformation.annotations);
      if (!paramMethodInformation.deallocator)
        break label510;
      str2 = "";
      if ((!paramMethodInformation.returnType.isPrimitive()) && (localAdapterInformation != null))
        str2 = ")" + str2;
      if ((Pointer.class.isAssignableFrom(paramMethodInformation.returnType)) || ((paramMethodInformation.returnType.isArray()) && (paramMethodInformation.returnType.getComponentType().isPrimitive())))
      {
        if (!(localAnnotation instanceof ByVal))
          break label518;
        str2 = ")" + str2;
      }
      this.out.println(str2);
      if (paramMethodInformation.returnType != Void.TYPE)
        break label822;
      if ((paramMethodInformation.allocator) || (paramMethodInformation.arrayAllocator))
      {
        PrintWriter localPrintWriter2 = this.out;
        StringBuilder localStringBuilder2 = new StringBuilder().append(str1).append("jint rcapacity = ");
        if (!paramMethodInformation.arrayAllocator)
          break label695;
        str7 = "arg0;";
        localPrintWriter2.println(str7);
        if ((paramMethodInformation.cls != Pointer.class) && (!paramMethodInformation.cls.isAnnotationPresent(NoDeallocator.class)))
          break label703;
        k = 1;
        Annotation[] arrayOfAnnotation = paramMethodInformation.annotations;
        int m = arrayOfAnnotation.length;
        n = 0;
        label282: if (n < m)
        {
          if (!(arrayOfAnnotation[n] instanceof NoDeallocator))
            break label709;
          k = 1;
        }
        if (k != 0)
          break label740;
        this.out.println(str1 + "jvalue args[3];");
        this.out.println(str1 + "args[0].j = ptr_to_jlong(rptr);");
        this.out.println(str1 + "args[1].i = rcapacity;");
        this.out.print(str1 + "args[2].j = ptr_to_jlong(&JavaCPP_" + mangle(paramMethodInformation.cls.getName()));
        if (!paramMethodInformation.arrayAllocator)
          break label715;
        this.out.println("_deallocateArray);");
        this.arrayDeallocators.register(paramMethodInformation.cls);
        label458: this.out.println(str1 + "env->CallNonvirtualVoidMethodA(obj, JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), JavaCPP_initMID, args);");
      }
    }
    label510: 
    do
    {
      do
      {
        do
        {
          return;
          str1 = "    ";
          break;
          str2 = ";";
          break label56;
          if (!(localAnnotation instanceof ByPtrPtr))
            break label158;
          this.out.println(str2);
          str2 = "";
          this.out.println(str1 + "if (rptrptr == NULL) {");
          this.out.println(str1 + "    env->ThrowNew(JavaCPP_getClass(env, " + this.jclasses.register(NullPointerException.class) + "), \"Return pointer address is NULL.\");");
          this.out.println(str1 + "} else {");
          this.out.println(str1 + "    rptr = *rptrptr;");
          this.out.println(str1 + "}");
          break label158;
          str7 = "1;";
          break label228;
          k = 0;
          break label268;
          n++;
          break label282;
          this.out.println("_deallocate);");
          this.deallocators.register(paramMethodInformation.cls);
          break label458;
          this.out.println(str1 + "env->SetLongField(obj, JavaCPP_addressFID, ptr_to_jlong(rptr));");
          this.out.println(str1 + "env->SetIntField(obj, JavaCPP_limitFID, rcapacity);");
          this.out.println(str1 + "env->SetIntField(obj, JavaCPP_capacityFID, rcapacity);");
          return;
        }
        while ((paramMethodInformation.valueSetter) || (paramMethodInformation.memberSetter) || (paramMethodInformation.noReturnGetter));
        if (paramMethodInformation.returnType.isPrimitive())
        {
          this.out.println(str1 + "rarg = (" + getJNITypeName(paramMethodInformation.returnType) + ")rvalue;");
          return;
        }
        if (paramMethodInformation.returnRaw)
        {
          this.out.println(str1 + "rarg = rptr;");
          return;
        }
        java.lang.String str6;
        int i;
        if (localAdapterInformation != null)
        {
          this.out.println(str1 + "rptr = radapter;");
          if (paramMethodInformation.returnType != java.lang.String.class)
          {
            this.out.println(str1 + "jint rcapacity = (jint)radapter.size;");
            PrintWriter localPrintWriter1 = this.out;
            StringBuilder localStringBuilder1 = new StringBuilder().append(str1).append("jlong deallocator = ");
            if (localAdapterInformation.constant)
            {
              str6 = "0;";
              localPrintWriter1.println(str6);
            }
          }
          else
          {
            i = 1;
          }
        }
        while (true)
          if (Pointer.class.isAssignableFrom(paramMethodInformation.returnType))
          {
            this.out.print(str1);
            if (!(localAnnotation instanceof ByVal))
            {
              int j;
              if ((Modifier.isStatic(paramMethodInformation.modifiers)) && (paramMethodInformation.parameterTypes.length > 0))
                j = 0;
              while (true)
                if (j < paramMethodInformation.parameterTypes.length)
                {
                  java.lang.String str5 = getParameterCast(paramMethodInformation, j);
                  if (paramMethodInformation.parameterTypes[j] == paramMethodInformation.returnType)
                  {
                    this.out.println("if (rptr == " + str5 + "ptr" + j + ") {");
                    this.out.println(str1 + "    rarg = arg" + j + ";");
                    this.out.print(str1 + "} else ");
                  }
                  j++;
                  continue;
                  str6 = "ptr_to_jlong(&(" + localAdapterInformation.name + "::deallocate));";
                  break;
                  if (!(localAnnotation instanceof ByVal))
                  {
                    boolean bool = FunctionPointer.class.isAssignableFrom(paramMethodInformation.returnType);
                    i = 0;
                    if (!bool)
                      break label1056;
                  }
                  this.out.println(str1 + "jint rcapacity = 1;");
                  this.out.println(str1 + "jlong deallocator = ptr_to_jlong(&JavaCPP_" + mangle(paramMethodInformation.returnType.getName()) + "_deallocate);");
                  this.deallocators.register(paramMethodInformation.returnType);
                  i = 1;
                  break label1056;
                  if ((!Modifier.isStatic(paramMethodInformation.modifiers)) && (paramMethodInformation.cls == paramMethodInformation.returnType))
                  {
                    this.out.println("if (rptr == ptr) {");
                    this.out.println(str1 + "    rarg = obj;");
                    this.out.print(str1 + "} else ");
                  }
                }
            }
            this.out.println("if (rptr != NULL) {");
            this.out.println(str1 + "    rarg = env->AllocObject(JavaCPP_getClass(env, " + this.jclasses.register(paramMethodInformation.returnType) + "));");
            if (i != 0)
            {
              this.out.println(str1 + "    if (deallocator != 0) {");
              this.out.println(str1 + "        jvalue args[3];");
              this.out.println(str1 + "        args[0].j = ptr_to_jlong(rptr);");
              this.out.println(str1 + "        args[1].i = rcapacity;");
              this.out.println(str1 + "        args[2].j = deallocator;");
              this.out.println(str1 + "        env->CallNonvirtualVoidMethodA(rarg, JavaCPP_getClass(env, " + this.jclasses.register(Pointer.class) + "), JavaCPP_initMID, args);");
              this.out.println(str1 + "    } else {");
              this.out.println(str1 + "        env->SetLongField(rarg, JavaCPP_addressFID, ptr_to_jlong(rptr));");
              this.out.println(str1 + "        env->SetIntField(rarg, JavaCPP_limitFID, rcapacity);");
              this.out.println(str1 + "        env->SetIntField(rarg, JavaCPP_capacityFID, rcapacity);");
              this.out.println(str1 + "    }");
            }
            while (true)
            {
              this.out.println(str1 + "}");
              return;
              this.out.println(str1 + "    env->SetLongField(rarg, JavaCPP_addressFID, ptr_to_jlong(rptr));");
            }
          }
        if (paramMethodInformation.returnType == java.lang.String.class)
        {
          this.out.println(str1 + "if (rptr != NULL) {");
          this.out.println(str1 + "    rarg = env->NewStringUTF(rptr);");
          this.out.println(str1 + "}");
          return;
        }
        if ((!paramMethodInformation.returnType.isArray()) || (!paramMethodInformation.returnType.getComponentType().isPrimitive()))
          break label2342;
        if (localAdapterInformation == null)
          this.out.println(str1 + "jint rcapacity = rptr != NULL ? 1 : 0;");
        java.lang.String str3 = paramMethodInformation.returnType.getComponentType().getName();
        java.lang.String str4 = Character.toUpperCase(str3.charAt(0)) + str3.substring(1);
        this.out.println(str1 + "if (rptr != NULL) {");
        this.out.println(str1 + "    rarg = env->New" + str4 + "Array(rcapacity);");
        this.out.println(str1 + "    env->Set" + str4 + "ArrayRegion(rarg, 0, rcapacity, (j" + str3 + "*)rptr);");
        this.out.println(str1 + "}");
      }
      while (localAdapterInformation == null);
      this.out.println(str1 + "if (deallocator != 0 && rptr != NULL) {");
      this.out.println(str1 + "    (*(void(*)(void*))jlong_to_ptr(deallocator))((void*)rptr);");
      this.out.println(str1 + "}");
      return;
    }
    while (!Buffer.class.isAssignableFrom(paramMethodInformation.returnType));
    label518: label695: label703: label709: label715: label740: if (paramMethodInformation.bufferGetter)
      this.out.println(str1 + "jint rcapacity = size;");
    while (true)
    {
      label822: this.out.println(str1 + "if (rptr != NULL) {");
      label1056: label2342: this.out.println(str1 + "    rarg = env->NewDirectByteBuffer(rptr, rcapacity);");
      this.out.println(str1 + "}");
      return;
      if (localAdapterInformation == null)
        this.out.println(str1 + "jint rcapacity = rptr != NULL ? 1 : 0;");
    }
  }

  private java.lang.String doReturnBefore(MethodInformation paramMethodInformation)
  {
    java.lang.String str1 = "";
    if (paramMethodInformation.returnType == Void.TYPE)
      if ((paramMethodInformation.allocator) || (paramMethodInformation.arrayAllocator))
      {
        if (paramMethodInformation.cls != Pointer.class)
        {
          this.out.println("    if (!env->IsSameObject(env->GetObjectClass(obj), JavaCPP_getClass(env, " + this.jclasses.register(paramMethodInformation.cls) + "))) {");
          this.out.println("        return;");
          this.out.println("    }");
        }
        java.lang.String[] arrayOfString2 = getCPPTypeName(paramMethodInformation.cls);
        str1 = arrayOfString2[0] + " rptr" + arrayOfString2[1] + " = ";
      }
    java.lang.String str2;
    java.lang.String[] arrayOfString1;
    while (true)
    {
      if (paramMethodInformation.throwsException != null)
      {
        this.out.println("    jthrowable exc = NULL;");
        this.out.println("    try {");
      }
      return str1;
      str2 = getCast(paramMethodInformation.annotations, paramMethodInformation.returnType);
      arrayOfString1 = getCastedCPPTypeName(paramMethodInformation.annotations, paramMethodInformation.returnType);
      if ((paramMethodInformation.valueSetter) || (paramMethodInformation.memberSetter) || (paramMethodInformation.noReturnGetter))
      {
        this.out.println("    jobject rarg = obj;");
      }
      else
      {
        if (!paramMethodInformation.returnType.isPrimitive())
          break;
        this.out.println("    " + getJNITypeName(paramMethodInformation.returnType) + " rarg = 0;");
        str1 = arrayOfString1[0] + " rvalue" + arrayOfString1[1] + " = " + str2;
      }
    }
    Annotation localAnnotation = getBy(paramMethodInformation.annotations);
    java.lang.String str3 = getValueTypeName(arrayOfString1);
    str1 = "rptr = " + str2;
    if ((arrayOfString1[0].length() == 0) || (paramMethodInformation.returnRaw))
    {
      paramMethodInformation.returnRaw = true;
      arrayOfString1[0] = getJNITypeName(paramMethodInformation.returnType);
      this.out.println("    " + arrayOfString1[0] + " rarg = NULL;");
      this.out.println("    " + arrayOfString1[0] + " rptr;");
    }
    while (true)
    {
      AdapterInformation localAdapterInformation = getAdapterInformation(false, str3, paramMethodInformation.annotations);
      if (localAdapterInformation == null)
        break;
      this.usesAdapters = true;
      str1 = localAdapterInformation.name + " radapter(";
      break;
      if ((Pointer.class.isAssignableFrom(paramMethodInformation.returnType)) || (Buffer.class.isAssignableFrom(paramMethodInformation.returnType)) || ((paramMethodInformation.returnType.isArray()) && (paramMethodInformation.returnType.getComponentType().isPrimitive())))
      {
        if (FunctionPointer.class.isAssignableFrom(paramMethodInformation.returnType))
        {
          arrayOfString1[0] = (getFunctionClassName(paramMethodInformation.returnType) + "*");
          arrayOfString1[1] = "";
          str3 = getValueTypeName(arrayOfString1);
          str1 = "if (rptr != NULL) rptr->ptr = ";
        }
        java.lang.String str4;
        if ((localAnnotation instanceof ByVal))
        {
          StringBuilder localStringBuilder = new StringBuilder().append(str1);
          if (getNoException(paramMethodInformation.returnType, paramMethodInformation.method))
          {
            str4 = "new (std::nothrow) ";
            label662: str1 = str4 + str3 + arrayOfString1[1] + "(";
            label690: if (!paramMethodInformation.bufferGetter)
              break label892;
            this.out.println("    jobject rarg = NULL;");
            this.out.println("    char* rptr;");
          }
        }
        while (true)
        {
          if (!FunctionPointer.class.isAssignableFrom(paramMethodInformation.returnType))
            break label979;
          this.out.println("    rptr = new (std::nothrow) " + str3 + ";");
          break;
          str4 = "new ";
          break label662;
          if ((localAnnotation instanceof ByRef))
          {
            str1 = str1 + "&";
            break label690;
          }
          if (!(localAnnotation instanceof ByPtrPtr))
            break label690;
          if (str2.length() > 0)
            arrayOfString1[0] = arrayOfString1[0].substring(0, -1 + arrayOfString1[0].length());
          str1 = "rptr = NULL; " + arrayOfString1[0] + "* rptrptr" + arrayOfString1[1] + " = " + str2;
          break label690;
          label892: this.out.println("    " + getJNITypeName(paramMethodInformation.returnType) + " rarg = NULL;");
          this.out.println("    " + arrayOfString1[0] + " rptr" + arrayOfString1[1] + ";");
        }
      }
      else
      {
        label979: if (paramMethodInformation.returnType == java.lang.String.class)
        {
          this.out.println("    jstring rarg = NULL;");
          this.out.println("    const char* rptr;");
          if ((localAnnotation instanceof ByRef))
            str1 = "std::string rstr(";
          else
            str1 = str1 + "(const char*)";
        }
        else
        {
          logger.log(Level.WARNING, "Method \"" + paramMethodInformation.method + "\" has unsupported return type \"" + paramMethodInformation.returnType.getCanonicalName() + "\". Compilation will most likely fail.");
        }
      }
    }
  }

  public static AdapterInformation getAdapterInformation(boolean paramBoolean, java.lang.String paramString, Annotation[] paramArrayOfAnnotation)
  {
    AdapterInformation localAdapterInformation = null;
    boolean bool1 = false;
    Object localObject = "";
    int i = paramArrayOfAnnotation.length;
    int j = 0;
    if (j < i)
    {
      Annotation localAnnotation = paramArrayOfAnnotation[j];
      Adapter localAdapter;
      if ((localAnnotation instanceof Adapter))
      {
        localAdapter = (Adapter)localAnnotation;
        if (localAdapter == null)
          break label403;
        localAdapterInformation = new AdapterInformation();
        localAdapterInformation.name = localAdapter.value();
        localAdapterInformation.argc = localAdapter.argc();
        if (localAnnotation == localAdapter);
      }
      while (true)
      {
        try
        {
          while (true)
          {
            Class localClass = localAnnotation.annotationType();
            boolean bool2 = localClass.isAnnotationPresent(Const.class);
            if (bool2)
              bool1 = true;
            try
            {
              java.lang.String str2 = localClass.getDeclaredMethod("value", new Class[0]).invoke(localAnnotation, new Object[0]).toString();
              if (str2 != null)
              {
                int k = str2.length();
                if (k > 0)
                  paramString = str2;
              }
              Cast localCast1 = (Cast)localClass.getAnnotation(Cast.class);
              if ((localCast1 != null) && (((java.lang.String)localObject).length() == 0))
              {
                localObject = localCast1.value()[0];
                if (paramString != null)
                  localObject = (java.lang.String)localObject + "< " + paramString + " >";
                if (localCast1.value().length > 1)
                {
                  java.lang.String str1 = (java.lang.String)localObject + localCast1.value()[1];
                  localObject = str1;
                }
              }
              if ((paramString != null) && (paramString.length() > 0))
                localAdapterInformation.name = (localAdapterInformation.name + "< " + paramString + " >");
              j++;
              break;
              localAdapter = (Adapter)localAnnotation.annotationType().getAnnotation(Adapter.class);
            }
            catch (NoSuchMethodException localNoSuchMethodException)
            {
              while (true)
                paramString = null;
            }
          }
        }
        catch (Exception localException)
        {
          logger.log(Level.WARNING, "Could not invoke the value() method on annotation \"" + localAnnotation + "\".", localException);
          continue;
        }
        label403: if ((localAnnotation instanceof Const))
        {
          bool1 = true;
        }
        else if ((localAnnotation instanceof Cast))
        {
          Cast localCast2 = (Cast)localAnnotation;
          if (localCast2.value().length > 1)
            localObject = localCast2.value()[1];
        }
      }
    }
    if (localAdapterInformation != null)
    {
      localAdapterInformation.cast = ((java.lang.String)localObject);
      localAdapterInformation.constant = bool1;
    }
    if ((paramBoolean) && (bool1))
      localAdapterInformation = null;
    return localAdapterInformation;
  }

  public static java.lang.String[] getAnnotatedCPPTypeName(Annotation[] paramArrayOfAnnotation, Class<?> paramClass)
  {
    java.lang.String[] arrayOfString = getCastedCPPTypeName(paramArrayOfAnnotation, paramClass);
    java.lang.String str1 = arrayOfString[0];
    java.lang.String str2 = arrayOfString[1];
    int i = paramArrayOfAnnotation.length;
    int j = 0;
    int k = 0;
    Annotation localAnnotation1;
    if (j < i)
    {
      Annotation localAnnotation2 = paramArrayOfAnnotation[j];
      if ((((localAnnotation2 instanceof Cast)) && (((Cast)localAnnotation2).value()[0].length() > 0)) || ((localAnnotation2 instanceof Const)))
        k = 1;
    }
    else
    {
      localAnnotation1 = getBy(paramArrayOfAnnotation);
      if (!(localAnnotation1 instanceof ByVal))
        break label111;
      str1 = getValueTypeName(arrayOfString);
    }
    while (true)
    {
      arrayOfString[0] = str1;
      arrayOfString[1] = str2;
      return arrayOfString;
      j++;
      break;
      label111: if ((localAnnotation1 instanceof ByRef))
        str1 = getValueTypeName(arrayOfString) + "&";
      else if (((localAnnotation1 instanceof ByPtrPtr)) && (k == 0))
        str1 = str1 + "*";
      else if ((localAnnotation1 instanceof ByPtrRef))
        str1 = str1 + "&";
    }
  }

  public static Annotation getBehavior(Annotation[] paramArrayOfAnnotation)
  {
    Object localObject = null;
    int i = paramArrayOfAnnotation.length;
    int j = 0;
    if (j < i)
    {
      Annotation localAnnotation = paramArrayOfAnnotation[j];
      if (((localAnnotation instanceof Function)) || ((localAnnotation instanceof Allocator)) || ((localAnnotation instanceof ArrayAllocator)) || ((localAnnotation instanceof ValueSetter)) || ((localAnnotation instanceof ValueGetter)) || ((localAnnotation instanceof MemberGetter)) || ((localAnnotation instanceof MemberSetter)))
      {
        if (localObject == null)
          break label129;
        logger.log(Level.WARNING, "Behavior annotation \"" + localObject + "\" already found. Ignoring superfluous annotation \"" + localAnnotation + "\".");
      }
      while (true)
      {
        j++;
        break;
        label129: localObject = localAnnotation;
      }
    }
    return localObject;
  }

  public static Annotation getBy(Annotation[] paramArrayOfAnnotation)
  {
    Object localObject = null;
    int i = paramArrayOfAnnotation.length;
    int j = 0;
    if (j < i)
    {
      Annotation localAnnotation = paramArrayOfAnnotation[j];
      if (((localAnnotation instanceof ByPtr)) || ((localAnnotation instanceof ByPtrPtr)) || ((localAnnotation instanceof ByPtrRef)) || ((localAnnotation instanceof ByRef)) || ((localAnnotation instanceof ByVal)))
      {
        if (localObject == null)
          break label113;
        logger.log(Level.WARNING, "\"By\" annotation \"" + localObject + "\" already found. Ignoring superfluous annotation \"" + localAnnotation + "\".");
      }
      while (true)
      {
        j++;
        break;
        label113: localObject = localAnnotation;
      }
    }
    return localObject;
  }

  public static java.lang.String getCPPScopeName(MethodInformation paramMethodInformation)
  {
    java.lang.String str1 = getCPPScopeName(paramMethodInformation.cls);
    Namespace localNamespace = (Namespace)paramMethodInformation.method.getAnnotation(Namespace.class);
    if (localNamespace == null);
    for (java.lang.String str2 = ""; ; str2 = localNamespace.value())
    {
      if (((localNamespace != null) && (localNamespace.value().length() == 0)) || (str2.startsWith("::")))
        str1 = "";
      if ((str1.length() > 0) && (!str1.endsWith("::")))
        str1 = str1 + "::";
      java.lang.String str3 = str1 + str2;
      if ((str2.length() > 0) && (!str2.endsWith("::")))
        str3 = str3 + "::";
      return str3 + paramMethodInformation.memberName[0];
    }
  }

  public static java.lang.String getCPPScopeName(Class<?> paramClass)
  {
    java.lang.String str1 = "";
    while (true)
    {
      Namespace localNamespace;
      java.lang.String str2;
      Name localName;
      java.lang.String str4;
      int i;
      if (paramClass != null)
      {
        localNamespace = (Namespace)paramClass.getAnnotation(Namespace.class);
        if (localNamespace != null)
          break label241;
        str2 = "";
        if ((Pointer.class.isAssignableFrom(paramClass)) && (paramClass != Pointer.class))
        {
          localName = (Name)paramClass.getAnnotation(Name.class);
          if (localName != null)
            break label251;
          str4 = paramClass.getName();
          i = str4.lastIndexOf("$");
          if (i < 0)
            i = str4.lastIndexOf(".");
        }
      }
      label241: label251: for (java.lang.String str3 = str4.substring(i + 1); ; str3 = localName.value()[0])
      {
        if ((str2.length() > 0) && (!str2.endsWith("::")))
          str2 = str2 + "::";
        str2 = str2 + str3;
        if ((str1.length() > 0) && (!str2.endsWith("::")))
          str2 = str2 + "::";
        str1 = str2 + str1;
        if (((localNamespace == null) || (localNamespace.value().length() != 0)) && (!str2.startsWith("::")))
          break label265;
        return str1;
        str2 = localNamespace.value();
        break;
      }
      label265: paramClass = paramClass.getDeclaringClass();
    }
  }

  public static java.lang.String[] getCPPTypeName(Class<?> paramClass)
  {
    java.lang.String str1 = "";
    java.lang.String str2 = "";
    if ((paramClass == Buffer.class) || (paramClass == Pointer.class))
      str1 = "void*";
    while (true)
    {
      return new java.lang.String[] { str1, str2 };
      if ((paramClass == [B.class) || (paramClass == ByteBuffer.class) || (paramClass == BytePointer.class))
      {
        str1 = "signed char*";
      }
      else if ((paramClass == [S.class) || (paramClass == ShortBuffer.class) || (paramClass == ShortPointer.class))
      {
        str1 = "short*";
      }
      else if ((paramClass == [I.class) || (paramClass == IntBuffer.class) || (paramClass == IntPointer.class))
      {
        str1 = "int*";
      }
      else if ((paramClass == [J.class) || (paramClass == LongBuffer.class) || (paramClass == LongPointer.class))
      {
        str1 = "jlong*";
      }
      else if ((paramClass == [F.class) || (paramClass == FloatBuffer.class) || (paramClass == FloatPointer.class))
      {
        str1 = "float*";
      }
      else if ((paramClass == [D.class) || (paramClass == DoubleBuffer.class) || (paramClass == DoublePointer.class))
      {
        str1 = "double*";
      }
      else if ((paramClass == [C.class) || (paramClass == CharBuffer.class) || (paramClass == CharPointer.class))
      {
        str1 = "unsigned short*";
      }
      else if (paramClass == [Z.class)
      {
        str1 = "unsigned char*";
      }
      else if (paramClass == PointerPointer.class)
      {
        str1 = "void**";
      }
      else if (paramClass == java.lang.String.class)
      {
        str1 = "const char*";
      }
      else if (paramClass == Byte.TYPE)
      {
        str1 = "signed char";
      }
      else if (paramClass == Long.TYPE)
      {
        str1 = "jlong";
      }
      else if (paramClass == Character.TYPE)
      {
        str1 = "unsigned short";
      }
      else if (paramClass == Boolean.TYPE)
      {
        str1 = "unsigned char";
      }
      else if (paramClass.isPrimitive())
      {
        str1 = paramClass.getName();
      }
      else if (FunctionPointer.class.isAssignableFrom(paramClass))
      {
        Method localMethod = getFunctionMethod(paramClass, null);
        if (localMethod != null)
        {
          Convention localConvention = (Convention)paramClass.getAnnotation(Convention.class);
          java.lang.String str4;
          Namespace localNamespace;
          java.lang.String str5;
          label400: Class[] arrayOfClass;
          java.lang.String[] arrayOfString1;
          java.lang.String str6;
          label515: int i;
          label621: java.lang.String[] arrayOfString2;
          AdapterInformation localAdapterInformation2;
          if (localConvention == null)
          {
            str4 = "";
            localNamespace = (Namespace)paramClass.getAnnotation(Namespace.class);
            if (localNamespace != null)
              break label781;
            str5 = "";
            if ((str5.length() > 0) && (!str5.endsWith("::")))
              str5 = str5 + "::";
            Class localClass = localMethod.getReturnType();
            arrayOfClass = localMethod.getParameterTypes();
            Annotation[] arrayOfAnnotation = localMethod.getAnnotations();
            Annotation[][] arrayOfAnnotation1 = localMethod.getParameterAnnotations();
            arrayOfString1 = getAnnotatedCPPTypeName(arrayOfAnnotation, localClass);
            AdapterInformation localAdapterInformation1 = getAdapterInformation(false, getValueTypeName(arrayOfString1), arrayOfAnnotation);
            if ((localAdapterInformation1 == null) || (localAdapterInformation1.cast.length() <= 0))
              break label793;
            str6 = localAdapterInformation1.cast;
            str1 = str6 + " (" + str4 + str5 + "*";
            str7 = ")(";
            if ((localNamespace != null) && (!Pointer.class.isAssignableFrom(arrayOfClass[0])))
              logger.log(Level.WARNING, "First parameter of caller method call() or apply() for member function pointer " + paramClass.getCanonicalName() + " is not a Pointer. Compilation will most likely fail.");
            if (localNamespace != null)
              break label822;
            i = 0;
            if (i >= arrayOfClass.length)
              break label873;
            arrayOfString2 = getAnnotatedCPPTypeName(arrayOfAnnotation1[i], arrayOfClass[i]);
            localAdapterInformation2 = getAdapterInformation(false, getValueTypeName(arrayOfString2), arrayOfAnnotation1[i]);
            if ((localAdapterInformation2 == null) || (localAdapterInformation2.cast.length() <= 0))
              break label828;
          }
          label781: label793: label822: label828: for (java.lang.String str7 = str7 + localAdapterInformation2.cast + " arg" + i; ; str7 = str7 + arrayOfString2[0] + " arg" + i + arrayOfString2[1])
          {
            if (i < -1 + arrayOfClass.length)
              str7 = str7 + ", ";
            i++;
            break label621;
            str4 = localConvention.value() + " ";
            break;
            str5 = localNamespace.value();
            break label400;
            str6 = arrayOfString1[0] + arrayOfString1[1];
            break label515;
            i = 1;
            break label621;
          }
          label873: str2 = str7 + ")";
          if (paramClass.isAnnotationPresent(Const.class))
            str2 = str2 + " const";
        }
      }
      else
      {
        java.lang.String str3 = getCPPScopeName(paramClass);
        if (str3.length() > 0)
          str1 = str3 + "*";
        else
          logger.log(Level.WARNING, "The class " + paramClass.getCanonicalName() + " does not map to any C++ type. Compilation will most likely fail.");
      }
    }
  }

  public static java.lang.String getCast(Annotation[] paramArrayOfAnnotation, Class<?> paramClass)
  {
    int i = paramArrayOfAnnotation.length;
    for (int j = 0; ; j++)
    {
      java.lang.String[] arrayOfString = null;
      if (j < i)
      {
        Annotation localAnnotation = paramArrayOfAnnotation[j];
        if ((((localAnnotation instanceof Cast)) && (((Cast)localAnnotation).value()[0].length() > 0)) || ((localAnnotation instanceof Const)))
          arrayOfString = getCastedCPPTypeName(paramArrayOfAnnotation, paramClass);
      }
      else
      {
        if ((arrayOfString == null) || (arrayOfString.length <= 0))
          break;
        return "(" + arrayOfString[0] + arrayOfString[1] + ")";
      }
    }
    return "";
  }

  public static java.lang.String[] getCastedCPPTypeName(Annotation[] paramArrayOfAnnotation, Class<?> paramClass)
  {
    java.lang.String[] arrayOfString = null;
    int i = 0;
    int j = 0;
    int k = paramArrayOfAnnotation.length;
    int m = 0;
    if (m < k)
    {
      Annotation localAnnotation = paramArrayOfAnnotation[m];
      if ((localAnnotation instanceof Cast))
        if (arrayOfString != null)
        {
          i = 1;
          label41: java.lang.String str1 = ((Cast)localAnnotation).value()[0];
          java.lang.String str2 = "";
          int n = str1.indexOf(')');
          if (n > 0)
          {
            str2 = str1.substring(n).trim();
            str1 = str1.substring(0, n).trim();
          }
          if (str1.length() <= 0)
            break label132;
          arrayOfString = new java.lang.String[] { str1, str2 };
        }
      while (true)
      {
        m++;
        break;
        i = 0;
        break label41;
        label132: arrayOfString = null;
        continue;
        if ((localAnnotation instanceof Const))
        {
          if (arrayOfString != null)
          {
            i = 1;
            label151: if (i != 0)
              break label240;
            arrayOfString = getCPPTypeName(paramClass);
            if (!((Const)localAnnotation).value())
              break label242;
            arrayOfString[0] = (getValueTypeName(arrayOfString) + " const *");
          }
          while (true)
          {
            if (!(getBy(paramArrayOfAnnotation) instanceof ByPtrPtr))
              break label268;
            arrayOfString[0] = (arrayOfString[0] + "*");
            break;
            i = 0;
            break label151;
            label240: break;
            label242: arrayOfString[0] = ("const " + arrayOfString[0]);
          }
        }
        else
        {
          label268: if (((localAnnotation instanceof Adapter)) || (localAnnotation.annotationType().isAnnotationPresent(Adapter.class)))
            j = 1;
        }
      }
    }
    if ((i != 0) && (j == 0))
      logger.log(Level.WARNING, "Without \"Adapter\", \"Cast\" and \"Const\" annotations are mutually exclusive.");
    if (arrayOfString == null)
      arrayOfString = getCPPTypeName(paramClass);
    return arrayOfString;
  }

  private java.lang.String getFunctionClassName(Class<?> paramClass)
  {
    Name localName = (Name)paramClass.getAnnotation(Name.class);
    if (localName != null)
      return localName.value()[0];
    return "JavaCPP_" + mangle(paramClass.getName());
  }

  private static Method getFunctionMethod(Class<?> paramClass, boolean[] paramArrayOfBoolean)
  {
    if (!FunctionPointer.class.isAssignableFrom(paramClass))
    {
      localMethod = null;
      return localMethod;
    }
    Method[] arrayOfMethod = paramClass.getDeclaredMethods();
    Method localMethod = null;
    int i = 0;
    label24: java.lang.String str;
    int j;
    Class[] arrayOfClass;
    Class localClass;
    if (i < arrayOfMethod.length)
    {
      str = arrayOfMethod[i].getName();
      j = arrayOfMethod[i].getModifiers();
      arrayOfClass = arrayOfMethod[i].getParameterTypes();
      localClass = arrayOfMethod[i].getReturnType();
      if (!Modifier.isStatic(j))
        break label81;
    }
    while (true)
    {
      i++;
      break label24;
      break;
      label81: if ((paramArrayOfBoolean != null) && (str.startsWith("allocate")) && (Modifier.isNative(j)) && (localClass == Void.TYPE) && (arrayOfClass.length == 0))
        paramArrayOfBoolean[i] = true;
      else if ((str.startsWith("call")) || (str.startsWith("apply")))
        localMethod = arrayOfMethod[i];
    }
  }

  public static java.lang.String getJNITypeName(Class paramClass)
  {
    if (paramClass == Byte.TYPE)
      return "jbyte";
    if (paramClass == Short.TYPE)
      return "jshort";
    if (paramClass == Integer.TYPE)
      return "jint";
    if (paramClass == Long.TYPE)
      return "jlong";
    if (paramClass == Float.TYPE)
      return "jfloat";
    if (paramClass == Double.TYPE)
      return "jdouble";
    if (paramClass == Character.TYPE)
      return "jchar";
    if (paramClass == Boolean.TYPE)
      return "jboolean";
    if (paramClass == [B.class)
      return "jbyteArray";
    if (paramClass == [S.class)
      return "jshortArray";
    if (paramClass == [I.class)
      return "jintArray";
    if (paramClass == [J.class)
      return "jlongArray";
    if (paramClass == [F.class)
      return "jfloatArray";
    if (paramClass == [D.class)
      return "jdoubleArray";
    if (paramClass == [C.class)
      return "jcharArray";
    if (paramClass == [Z.class)
      return "jbooleanArray";
    if (paramClass.isArray())
      return "jobjectArray";
    if (paramClass == java.lang.String.class)
      return "jstring";
    if (paramClass == Class.class)
      return "jclass";
    if (paramClass == Void.TYPE)
      return "void";
    return "jobject";
  }

  public static MethodInformation getMethodInformation(Method paramMethod)
  {
    MethodInformation localMethodInformation;
    if (!Modifier.isNative(paramMethod.getModifiers()))
      localMethodInformation = null;
    label119: int k;
    label176: label312: int m;
    label294: label300: int n;
    label392: label415: int i1;
    label456: int i2;
    int i3;
    int i4;
    int i5;
    boolean bool2;
    Object localObject1;
    label486: Annotation localAnnotation;
    label558: label564: label570: label576: label858: boolean bool3;
    label771: label808: label826: label976: boolean bool4;
    label929: label935: label941: label950: label1212: label1261: 
    do
    {
      return localMethodInformation;
      localMethodInformation = new MethodInformation();
      localMethodInformation.cls = paramMethod.getDeclaringClass();
      localMethodInformation.method = paramMethod;
      localMethodInformation.annotations = paramMethod.getAnnotations();
      localMethodInformation.modifiers = paramMethod.getModifiers();
      localMethodInformation.returnType = paramMethod.getReturnType();
      localMethodInformation.name = paramMethod.getName();
      Name localName1 = (Name)paramMethod.getAnnotation(Name.class);
      java.lang.String[] arrayOfString;
      int i;
      boolean bool1;
      if (localName1 != null)
      {
        arrayOfString = localName1.value();
        localMethodInformation.memberName = arrayOfString;
        Index localIndex = (Index)paramMethod.getAnnotation(Index.class);
        if (localIndex == null)
          break label294;
        i = localIndex.value();
        localMethodInformation.dim = i;
        localMethodInformation.parameterTypes = paramMethod.getParameterTypes();
        localMethodInformation.parameterAnnotations = paramMethod.getParameterAnnotations();
        localMethodInformation.returnRaw = paramMethod.isAnnotationPresent(Raw.class);
        if (!localMethodInformation.returnRaw)
          break label300;
        bool1 = ((Raw)paramMethod.getAnnotation(Raw.class)).withEnv();
        localMethodInformation.withEnv = bool1;
        localMethodInformation.parameterRaw = new boolean[localMethodInformation.parameterAnnotations.length];
      }
      for (int j = 0; ; j++)
      {
        if (j >= localMethodInformation.parameterAnnotations.length)
          break label312;
        int i17 = 0;
        while (true)
          if (i17 < localMethodInformation.parameterAnnotations[j].length)
          {
            if ((localMethodInformation.parameterAnnotations[j][i17] instanceof Raw))
            {
              localMethodInformation.parameterRaw[j] = true;
              localMethodInformation.withEnv |= ((Raw)localMethodInformation.parameterAnnotations[j][i17]).withEnv();
            }
            i17++;
            continue;
            arrayOfString = new java.lang.String[1];
            arrayOfString[0] = localMethodInformation.name;
            break;
            i = 0;
            break label119;
            bool1 = false;
            break label176;
          }
      }
      int i6;
      Method localMethod;
      Class localClass1;
      java.lang.String str;
      Class[] arrayOfClass2;
      if ((localMethodInformation.returnType != Void.TYPE) || ((localMethodInformation.parameterTypes.length > 0) && (localMethodInformation.parameterTypes[0].isArray()) && (localMethodInformation.parameterTypes[0].getComponentType().isPrimitive())))
      {
        k = 1;
        if (((localMethodInformation.returnType != Void.TYPE) && (localMethodInformation.returnType != localMethodInformation.cls)) || (localMethodInformation.parameterTypes.length <= 0))
          break label558;
        m = 1;
        if ((Modifier.isStatic(localMethodInformation.modifiers)) || (localMethodInformation.returnType != Void.TYPE))
          break label564;
        n = 1;
        if ((n == 0) || (localMethodInformation.parameterTypes.length != 1) || ((localMethodInformation.parameterTypes[0] != Integer.TYPE) && (localMethodInformation.parameterTypes[0] != Long.TYPE)))
          break label570;
        i1 = 1;
        i2 = 0;
        i3 = 0;
        i4 = 0;
        i5 = 0;
        bool2 = false;
        localObject1 = null;
        Method[] arrayOfMethod = localMethodInformation.cls.getDeclaredMethods();
        i6 = 0;
        if (i6 >= arrayOfMethod.length)
          break label1054;
        localMethod = arrayOfMethod[i6];
        int i7 = localMethod.getModifiers();
        localClass1 = localMethod.getReturnType();
        str = localMethod.getName();
        arrayOfClass2 = localMethod.getParameterTypes();
        if ((!paramMethod.equals(localMethod)) && (Modifier.isNative(i7)))
          break label576;
      }
      int i8;
      int i14;
      Class localClass2;
      do
      {
        int i12;
        do
        {
          int i9;
          int i10;
          do
          {
            i6++;
            break label486;
            k = 0;
            break;
            m = 0;
            break label392;
            n = 0;
            break label415;
            i1 = 0;
            break label456;
            i8 = 0;
            if ((k != 0) && ("get".equals(localMethodInformation.name)) && ("put".equals(str)))
              i9 = 1;
            while (true)
            {
              i10 = 1;
              for (int i11 = 0; (i11 < localMethodInformation.parameterTypes.length) && (i11 < arrayOfClass2.length); i11++)
                if (localMethodInformation.parameterTypes[i11] != arrayOfClass2[i11])
                  i10 = 0;
              if ((m != 0) && ("put".equals(localMethodInformation.name)) && ("get".equals(str)))
              {
                i8 = 1;
                i9 = 0;
              }
              else
              {
                if (!str.equals(localMethodInformation.name))
                  break;
                localMethodInformation.overloaded = true;
                i9 = 0;
                i8 = 0;
              }
            }
          }
          while (i10 == 0);
          boolean bool5;
          int i16;
          Class localClass3;
          if ((i9 != 0) && (localMethodInformation.parameterTypes.length > 0) && (localMethodInformation.parameterTypes[0].isArray()) && (localMethodInformation.parameterTypes[0].getComponentType().isPrimitive()))
          {
            bool5 = true;
            if ((i8 == 0) || (arrayOfClass2.length <= 0) || (!arrayOfClass2[0].isArray()) || (!arrayOfClass2[0].getComponentType().isPrimitive()))
              break label929;
            i12 = 1;
            if (k == 0)
              continue;
            int i15 = arrayOfClass2.length;
            if (!bool5)
              break label935;
            i16 = 0;
            if (i15 - i16 != localMethodInformation.parameterTypes.length)
              continue;
            if (!bool5)
              break label941;
            localClass3 = localMethodInformation.parameterTypes[(-1 + localMethodInformation.parameterTypes.length)];
            Class localClass4 = arrayOfClass2[(-1 + arrayOfClass2.length)];
            if (localClass3 != localClass4)
              continue;
            Class localClass5 = Void.TYPE;
            if (localClass1 != localClass5)
            {
              Class localClass6 = localMethodInformation.cls;
              if (localClass1 != localClass6)
                continue;
            }
            localObject1 = localMethod;
            i2 = i9;
            if (i9 != 0)
              break label950;
          }
          for (i4 = 1; ; i4 = 0)
          {
            bool2 = bool5;
            break;
            bool5 = false;
            break label771;
            i12 = 0;
            break label808;
            i16 = 1;
            break label826;
            localClass3 = localMethodInformation.returnType;
            break label858;
          }
        }
        while (m == 0);
        int i13 = localMethodInformation.parameterTypes.length;
        if (i12 == 0)
          break label1042;
        i14 = 0;
        if (i13 - i14 != arrayOfClass2.length)
          break label1046;
        if (i12 != 0)
          localClass1 = arrayOfClass2[(-1 + arrayOfClass2.length)];
        localClass2 = localMethodInformation.parameterTypes[(-1 + localMethodInformation.parameterTypes.length)];
      }
      while (localClass1 != localClass2);
      localObject1 = localMethod;
      i3 = i8;
      if (i8 == 0);
      for (i5 = 1; ; i5 = 0)
      {
        break;
        i14 = 1;
        break label976;
        break;
      }
      localAnnotation = getBehavior(localMethodInformation.annotations);
      if ((k == 0) || (!(localAnnotation instanceof ValueGetter)))
        break;
      localMethodInformation.valueGetter = true;
      localMethodInformation.noReturnGetter = bool2;
      if ((localName1 == null) && (localMethodInformation.pairedMethod != null))
      {
        Name localName2 = (Name)localMethodInformation.pairedMethod.getAnnotation(Name.class);
        if (localName2 != null)
          localMethodInformation.memberName = localName2.value();
      }
      if ((!localMethodInformation.cls.isAnnotationPresent(NoOffset.class)) && (!paramMethod.isAnnotationPresent(NoOffset.class)) && (!paramMethod.isAnnotationPresent(Index.class)))
        break label1809;
      bool3 = true;
      localMethodInformation.noOffset = bool3;
      if ((!localMethodInformation.noOffset) && (localMethodInformation.pairedMethod != null))
      {
        if ((!localMethodInformation.pairedMethod.isAnnotationPresent(NoOffset.class)) && (!localMethodInformation.pairedMethod.isAnnotationPresent(Index.class)))
          break label1815;
        bool4 = true;
        localMethodInformation.noOffset = bool4;
      }
      if ((localMethodInformation.parameterTypes.length == 0) || (!localMethodInformation.parameterTypes[0].isArray()))
      {
        if ((!localMethodInformation.valueGetter) && (!localMethodInformation.memberGetter))
          break label1821;
        localMethodInformation.dim = localMethodInformation.parameterTypes.length;
      }
      localMethodInformation.throwsException = null;
    }
    while ((getNoException(localMethodInformation.cls, paramMethod)) || (((!(getBy(localMethodInformation.annotations) instanceof ByVal)) || (getNoException(localMethodInformation.returnType, paramMethod))) && ((localMethodInformation.deallocator) || (localMethodInformation.valueGetter) || (localMethodInformation.valueSetter) || (localMethodInformation.memberGetter) || (localMethodInformation.memberSetter) || (localMethodInformation.bufferGetter))));
    label1042: label1046: label1054: Class[] arrayOfClass1 = paramMethod.getExceptionTypes();
    label1164: if (arrayOfClass1.length > 0);
    for (Object localObject2 = arrayOfClass1[0]; ; localObject2 = RuntimeException.class)
    {
      localMethodInformation.throwsException = ((Class)localObject2);
      return localMethodInformation;
      if ((m != 0) && ((localAnnotation instanceof ValueSetter)))
      {
        localMethodInformation.valueSetter = true;
        break;
      }
      if ((k != 0) && ((localAnnotation instanceof MemberGetter)))
      {
        localMethodInformation.memberGetter = true;
        localMethodInformation.noReturnGetter = bool2;
        break;
      }
      if ((m != 0) && ((localAnnotation instanceof MemberSetter)))
      {
        localMethodInformation.memberSetter = true;
        break;
      }
      if ((n != 0) && ((localAnnotation instanceof Allocator)))
      {
        localMethodInformation.allocator = true;
        break;
      }
      if ((i1 != 0) && ((localAnnotation instanceof ArrayAllocator)))
      {
        localMethodInformation.arrayAllocator = true;
        localMethodInformation.allocator = true;
        break;
      }
      if (localAnnotation == null)
      {
        if ((localMethodInformation.returnType == Void.TYPE) && ("deallocate".equals(localMethodInformation.name)) && (!Modifier.isStatic(localMethodInformation.modifiers)) && (localMethodInformation.parameterTypes.length == 2) && (localMethodInformation.parameterTypes[0] == Long.TYPE) && (localMethodInformation.parameterTypes[1] == Long.TYPE))
        {
          localMethodInformation.deallocator = true;
          break;
        }
        if ((n != 0) && ("allocate".equals(localMethodInformation.name)))
        {
          localMethodInformation.allocator = true;
          break;
        }
        if ((i1 != 0) && ("allocateArray".equals(localMethodInformation.name)))
        {
          localMethodInformation.arrayAllocator = true;
          localMethodInformation.allocator = true;
          break;
        }
        if ((localMethodInformation.returnType.isAssignableFrom(ByteBuffer.class)) && ("asDirectBuffer".equals(localMethodInformation.name)) && (!Modifier.isStatic(localMethodInformation.modifiers)) && (localMethodInformation.parameterTypes.length == 0))
        {
          localMethodInformation.bufferGetter = true;
          break;
        }
        if (i2 != 0)
        {
          localMethodInformation.valueGetter = true;
          localMethodInformation.noReturnGetter = bool2;
          localMethodInformation.pairedMethod = localObject1;
          break;
        }
        if (i3 != 0)
        {
          localMethodInformation.valueSetter = true;
          localMethodInformation.pairedMethod = localObject1;
          break;
        }
        if (i4 != 0)
        {
          localMethodInformation.memberGetter = true;
          localMethodInformation.noReturnGetter = bool2;
          localMethodInformation.pairedMethod = localObject1;
          break;
        }
        if (i5 == 0)
          break;
        localMethodInformation.memberSetter = true;
        localMethodInformation.pairedMethod = localObject1;
        break;
      }
      logger.log(Level.WARNING, "Method \"" + paramMethod + "\" cannot behave like a \"" + localAnnotation + "\". No code will be generated.");
      return null;
      label1809: bool3 = false;
      break label1164;
      label1815: bool4 = false;
      break label1212;
      label1821: if ((!localMethodInformation.memberSetter) && (!localMethodInformation.valueSetter))
        break label1261;
      localMethodInformation.dim = (-1 + localMethodInformation.parameterTypes.length);
      break label1261;
    }
  }

  public static boolean getNoException(Class<?> paramClass, Method paramMethod)
  {
    boolean bool;
    if ((baseClasses.contains(paramClass)) || (paramMethod.isAnnotationPresent(NoException.class)))
      bool = true;
    while (true)
    {
      if ((!bool) && (paramClass != null))
      {
        bool = paramClass.isAnnotationPresent(NoException.class);
        if (!bool);
      }
      else
      {
        return bool;
        bool = false;
        continue;
      }
      paramClass = paramClass.getDeclaringClass();
    }
  }

  public static AdapterInformation getParameterAdapterInformation(boolean paramBoolean, MethodInformation paramMethodInformation, int paramInt)
  {
    AdapterInformation localAdapterInformation;
    if ((paramBoolean) && ((paramMethodInformation.parameterTypes[paramInt] == java.lang.String.class) || (paramMethodInformation.valueSetter) || (paramMethodInformation.memberSetter)))
      localAdapterInformation = null;
    java.lang.String str2;
    do
    {
      return localAdapterInformation;
      java.lang.String str1 = getParameterCast(paramMethodInformation, paramInt);
      if ((str1 != null) && (str1.startsWith("(")) && (str1.endsWith(")")))
        str1 = str1.substring(1, -1 + str1.length());
      if ((str1 == null) || (str1.length() == 0))
        str1 = getCastedCPPTypeName(paramMethodInformation.parameterAnnotations[paramInt], paramMethodInformation.parameterTypes[paramInt])[0];
      str2 = getValueTypeName(new java.lang.String[] { str1 });
      localAdapterInformation = getAdapterInformation(paramBoolean, str2, paramMethodInformation.parameterAnnotations[paramInt]);
    }
    while ((localAdapterInformation != null) || (paramMethodInformation.pairedMethod == null) || ((!paramMethodInformation.valueSetter) && (!paramMethodInformation.memberSetter)));
    return getAdapterInformation(paramBoolean, str2, paramMethodInformation.pairedMethod.getAnnotations());
  }

  public static Annotation getParameterBy(MethodInformation paramMethodInformation, int paramInt)
  {
    Annotation localAnnotation = getBy(paramMethodInformation.parameterAnnotations[paramInt]);
    if ((localAnnotation == null) && (paramMethodInformation.pairedMethod != null) && ((paramMethodInformation.valueSetter) || (paramMethodInformation.memberSetter)))
      localAnnotation = getBy(paramMethodInformation.pairedMethod.getAnnotations());
    return localAnnotation;
  }

  public static java.lang.String getParameterCast(MethodInformation paramMethodInformation, int paramInt)
  {
    java.lang.String str = getCast(paramMethodInformation.parameterAnnotations[paramInt], paramMethodInformation.parameterTypes[paramInt]);
    if (((str == null) || (str.length() == 0)) && (paramInt == -1 + paramMethodInformation.parameterTypes.length) && ((paramMethodInformation.valueSetter) || (paramMethodInformation.memberSetter)) && (paramMethodInformation.pairedMethod != null))
      str = getCast(paramMethodInformation.pairedMethod.getAnnotations(), paramMethodInformation.pairedMethod.getReturnType());
    return str;
  }

  public static java.lang.String getSignature(Class paramClass)
  {
    if (paramClass == Byte.TYPE)
      return "B";
    if (paramClass == Short.TYPE)
      return "S";
    if (paramClass == Integer.TYPE)
      return "I";
    if (paramClass == Long.TYPE)
      return "J";
    if (paramClass == Float.TYPE)
      return "F";
    if (paramClass == Double.TYPE)
      return "D";
    if (paramClass == Boolean.TYPE)
      return "Z";
    if (paramClass == Character.TYPE)
      return "C";
    if (paramClass == Void.TYPE)
      return "V";
    if (paramClass.isArray())
      return paramClass.getName().replace(".", "/");
    return "L" + paramClass.getName().replace(".", "/") + ";";
  }

  public static java.lang.String getSignature(Class[] paramArrayOfClass)
  {
    StringBuilder localStringBuilder = new StringBuilder(2 * paramArrayOfClass.length);
    for (int i = 0; i < paramArrayOfClass.length; i++)
      localStringBuilder.append(getSignature(paramArrayOfClass[i]));
    return localStringBuilder.toString();
  }

  public static java.lang.String getValueTypeName(java.lang.String[] paramArrayOfString)
  {
    java.lang.String str = paramArrayOfString[0];
    if (str.startsWith("const "))
      str = str.substring(6, -1 + str.length());
    while (str.length() == 0)
      return str;
    return str.substring(0, -1 + str.length());
  }

  public static java.lang.String mangle(java.lang.String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder(paramString.length());
    int i = 0;
    if (i < paramString.length())
    {
      char c = paramString.charAt(i);
      if (((c >= '0') && (c <= '9')) || ((c >= 'A') && (c <= 'Z')) || ((c >= 'a') && (c <= 'z')))
        localStringBuilder.append(c);
      while (true)
      {
        i++;
        break;
        if (c == '_')
        {
          localStringBuilder.append("_1");
        }
        else if (c == ';')
        {
          localStringBuilder.append("_2");
        }
        else if (c == '[')
        {
          localStringBuilder.append("_3");
        }
        else
        {
          if ((c != '.') && (c != '/'))
            break label150;
          localStringBuilder.append("_");
        }
      }
      label150: java.lang.String str = Integer.toHexString(c);
      localStringBuilder.append("_0");
      switch (str.length())
      {
      default:
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        localStringBuilder.append(str);
        break;
        localStringBuilder.append("0");
        localStringBuilder.append("0");
        localStringBuilder.append("0");
      }
    }
    return localStringBuilder.toString();
  }

  public boolean checkPlatform(Platform paramPlatform)
  {
    if (paramPlatform == null);
    java.lang.String[][] arrayOfString;;
    boolean[] arrayOfBoolean;
    do
    {
      return true;
      java.lang.String str = this.properties.getProperty("platform.name");
      arrayOfString; = new java.lang.String[2][];
      arrayOfString;[0] = paramPlatform.value();
      arrayOfString;[1] = paramPlatform.not();
      arrayOfBoolean = new boolean[] { 0, 0 };
      int i = 0;
      if (i < arrayOfString;.length)
      {
        [Ljava.lang.String localString; = arrayOfString;[i];
        int j = localString;.length;
        for (int k = 0; ; k++)
          if (k < j)
          {
            if (str.startsWith(localString;[k]))
              arrayOfBoolean[i] = true;
          }
          else
          {
            i++;
            break;
          }
      }
    }
    while (((arrayOfString;[0].length == 0) || (arrayOfBoolean[0] != 0)) && ((arrayOfString;[1].length == 0) || (arrayOfBoolean[1] == 0)));
    return false;
  }

  public boolean checkPlatform(Class<?> paramClass)
  {
    Properties localProperties = (Properties)paramClass.getAnnotation(Properties.class);
    if (localProperties != null)
    {
      Class[] arrayOfClass = localProperties.inherit();
      if (arrayOfClass != null)
      {
        int k = arrayOfClass.length;
        for (int m = 0; m < k; m++)
          if (checkPlatform(arrayOfClass[m]))
            return true;
      }
      Platform[] arrayOfPlatform = localProperties.value();
      if (arrayOfPlatform != null)
      {
        int i = arrayOfPlatform.length;
        for (int j = 0; j < i; j++)
          if (checkPlatform(arrayOfPlatform[j]))
            return true;
      }
    }
    else if (checkPlatform((Platform)paramClass.getAnnotation(Platform.class)))
    {
      return true;
    }
    return false;
  }

  public void close()
  {
    if (this.out != null)
      this.out.close();
    if (this.out2 != null)
      this.out2.close();
  }

  public boolean generate(java.lang.String paramString1, java.lang.String paramString2, java.lang.String paramString3, Class<?>[] paramArrayOfClass)
    throws FileNotFoundException
  {
    this.out = new PrintWriter(new Writer()
    {
      public void close()
      {
      }

      public void flush()
      {
      }

      public void write(char[] paramAnonymousArrayOfChar, int paramAnonymousInt1, int paramAnonymousInt2)
      {
      }
    });
    this.out2 = null;
    this.functionDefinitions = new LinkedListRegister();
    this.functionPointers = new LinkedListRegister();
    this.deallocators = new LinkedListRegister();
    this.arrayDeallocators = new LinkedListRegister();
    this.jclasses = new LinkedListRegister();
    this.jclassesInit = new LinkedListRegister();
    this.members = new HashMap();
    this.mayThrowExceptions = false;
    this.usesAdapters = false;
    boolean bool1 = doClasses(true, true, paramString3, paramArrayOfClass);
    boolean bool2 = false;
    if (bool1)
    {
      this.out = new PrintWriter(paramString1);
      if (paramString2 != null)
        this.out2 = new PrintWriter(paramString2);
      bool2 = doClasses(this.mayThrowExceptions, this.usesAdapters, paramString3, paramArrayOfClass);
    }
    return bool2;
  }

  public static class AdapterInformation
  {
    public int argc;
    public java.lang.String cast;
    public boolean constant;
    public java.lang.String name;
  }

  public static class LinkedListRegister<E> extends LinkedList<E>
  {
    public int register(E paramE)
    {
      int i = indexOf(paramE);
      if (i < 0)
      {
        add(paramE);
        i = -1 + size();
      }
      return i;
    }
  }

  public static class MethodInformation
  {
    public boolean allocator;
    public Annotation[] annotations;
    public boolean arrayAllocator;
    public boolean bufferGetter;
    public Class<?> cls;
    public boolean deallocator;
    public int dim;
    public boolean memberGetter;
    public java.lang.String[] memberName;
    public boolean memberSetter;
    public Method method;
    public int modifiers;
    public java.lang.String name;
    public boolean noOffset;
    public boolean noReturnGetter;
    public boolean overloaded;
    public Method pairedMethod;
    public Annotation[][] parameterAnnotations;
    public boolean[] parameterRaw;
    public Class<?>[] parameterTypes;
    public boolean returnRaw;
    public Class<?> returnType;
    public Class<?> throwsException;
    public boolean valueGetter;
    public boolean valueSetter;
    public boolean withEnv;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.Generator
 * JD-Core Version:    0.6.2
 */