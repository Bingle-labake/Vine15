package com.flurry.org.codehaus.jackson.map.introspect;

import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.ClassIntrospector.MixInResolver;
import com.flurry.org.codehaus.jackson.map.util.Annotations;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public final class AnnotatedClass extends Annotated
{
  private static final AnnotationMap[] NO_ANNOTATION_MAPS = new AnnotationMap[0];
  protected final AnnotationIntrospector _annotationIntrospector;
  protected final Class<?> _class;
  protected AnnotationMap _classAnnotations;
  protected List<AnnotatedConstructor> _constructors;
  protected List<AnnotatedMethod> _creatorMethods;
  protected AnnotatedConstructor _defaultConstructor;
  protected List<AnnotatedField> _fields;
  protected AnnotatedMethodMap _memberMethods;
  protected final ClassIntrospector.MixInResolver _mixInResolver;
  protected final Class<?> _primaryMixIn;
  protected final List<Class<?>> _superTypes;

  private AnnotatedClass(Class<?> paramClass, List<Class<?>> paramList, AnnotationIntrospector paramAnnotationIntrospector, ClassIntrospector.MixInResolver paramMixInResolver, AnnotationMap paramAnnotationMap)
  {
    this._class = paramClass;
    this._superTypes = paramList;
    this._annotationIntrospector = paramAnnotationIntrospector;
    this._mixInResolver = paramMixInResolver;
    if (this._mixInResolver == null);
    for (Class localClass = null; ; localClass = this._mixInResolver.findMixInClassFor(this._class))
    {
      this._primaryMixIn = localClass;
      this._classAnnotations = paramAnnotationMap;
      return;
    }
  }

  private AnnotationMap _emptyAnnotationMap()
  {
    return new AnnotationMap();
  }

  private AnnotationMap[] _emptyAnnotationMaps(int paramInt)
  {
    AnnotationMap[] arrayOfAnnotationMap;
    if (paramInt == 0)
      arrayOfAnnotationMap = NO_ANNOTATION_MAPS;
    while (true)
    {
      return arrayOfAnnotationMap;
      arrayOfAnnotationMap = new AnnotationMap[paramInt];
      for (int i = 0; i < paramInt; i++)
        arrayOfAnnotationMap[i] = _emptyAnnotationMap();
    }
  }

  private boolean _isIncludableField(Field paramField)
  {
    if (paramField.isSynthetic());
    int i;
    do
    {
      return false;
      i = paramField.getModifiers();
    }
    while ((Modifier.isStatic(i)) || (Modifier.isTransient(i)));
    return true;
  }

  public static AnnotatedClass construct(Class<?> paramClass, AnnotationIntrospector paramAnnotationIntrospector, ClassIntrospector.MixInResolver paramMixInResolver)
  {
    AnnotatedClass localAnnotatedClass = new AnnotatedClass(paramClass, ClassUtil.findSuperTypes(paramClass, null), paramAnnotationIntrospector, paramMixInResolver, null);
    localAnnotatedClass.resolveClassAnnotations();
    return localAnnotatedClass;
  }

  public static AnnotatedClass constructWithoutSuperTypes(Class<?> paramClass, AnnotationIntrospector paramAnnotationIntrospector, ClassIntrospector.MixInResolver paramMixInResolver)
  {
    AnnotatedClass localAnnotatedClass = new AnnotatedClass(paramClass, Collections.emptyList(), paramAnnotationIntrospector, paramMixInResolver, null);
    localAnnotatedClass.resolveClassAnnotations();
    return localAnnotatedClass;
  }

  protected void _addClassMixIns(AnnotationMap paramAnnotationMap, Class<?> paramClass)
  {
    if (this._mixInResolver != null)
      _addClassMixIns(paramAnnotationMap, paramClass, this._mixInResolver.findMixInClassFor(paramClass));
  }

  protected void _addClassMixIns(AnnotationMap paramAnnotationMap, Class<?> paramClass1, Class<?> paramClass2)
  {
    if (paramClass2 == null)
      return;
    for (Annotation localAnnotation2 : paramClass2.getDeclaredAnnotations())
      if (this._annotationIntrospector.isHandled(localAnnotation2))
        paramAnnotationMap.addIfNotPresent(localAnnotation2);
    Iterator localIterator = ClassUtil.findSuperTypes(paramClass2, paramClass1).iterator();
    while (localIterator.hasNext())
      for (Annotation localAnnotation1 : ((Class)localIterator.next()).getDeclaredAnnotations())
        if (this._annotationIntrospector.isHandled(localAnnotation1))
          paramAnnotationMap.addIfNotPresent(localAnnotation1);
  }

  protected void _addConstructorMixIns(Class<?> paramClass)
  {
    MemberKey[] arrayOfMemberKey = null;
    int i;
    int k;
    label25: Constructor localConstructor;
    if (this._constructors == null)
    {
      i = 0;
      Constructor[] arrayOfConstructor = paramClass.getDeclaredConstructors();
      int j = arrayOfConstructor.length;
      k = 0;
      if (k >= j)
        return;
      localConstructor = arrayOfConstructor[k];
      if (localConstructor.getParameterTypes().length != 0)
        break label85;
      if (this._defaultConstructor != null)
        _addMixOvers(localConstructor, this._defaultConstructor, false);
    }
    while (true)
    {
      k++;
      break label25;
      i = this._constructors.size();
      break;
      label85: if (arrayOfMemberKey == null)
      {
        arrayOfMemberKey = new MemberKey[i];
        for (int n = 0; n < i; n++)
          arrayOfMemberKey[n] = new MemberKey(((AnnotatedConstructor)this._constructors.get(n)).getAnnotated());
      }
      MemberKey localMemberKey = new MemberKey(localConstructor);
      for (int m = 0; m < i; m++)
        if (localMemberKey.equals(arrayOfMemberKey[m]))
          break label175;
      continue;
      label175: _addMixOvers(localConstructor, (AnnotatedConstructor)this._constructors.get(m), true);
    }
  }

  protected void _addFactoryMixIns(Class<?> paramClass)
  {
    MemberKey[] arrayOfMemberKey = null;
    int i = this._creatorMethods.size();
    Method[] arrayOfMethod = paramClass.getDeclaredMethods();
    int j = arrayOfMethod.length;
    int k = 0;
    if (k < j)
    {
      Method localMethod = arrayOfMethod[k];
      if (!Modifier.isStatic(localMethod.getModifiers()));
      while (true)
      {
        k++;
        break;
        if (localMethod.getParameterTypes().length != 0)
        {
          if (arrayOfMemberKey == null)
          {
            arrayOfMemberKey = new MemberKey[i];
            for (int n = 0; n < i; n++)
              arrayOfMemberKey[n] = new MemberKey(((AnnotatedMethod)this._creatorMethods.get(n)).getAnnotated());
          }
          MemberKey localMemberKey = new MemberKey(localMethod);
          for (int m = 0; m < i; m++)
            if (localMemberKey.equals(arrayOfMemberKey[m]))
              break label156;
          continue;
          label156: _addMixOvers(localMethod, (AnnotatedMethod)this._creatorMethods.get(m), true);
        }
      }
    }
  }

  protected void _addFieldMixIns(Class<?> paramClass, Map<String, AnnotatedField> paramMap)
  {
    Field[] arrayOfField = paramClass.getDeclaredFields();
    int i = arrayOfField.length;
    int j = 0;
    if (j < i)
    {
      Field localField = arrayOfField[j];
      if (!_isIncludableField(localField));
      while (true)
      {
        j++;
        break;
        AnnotatedField localAnnotatedField = (AnnotatedField)paramMap.get(localField.getName());
        if (localAnnotatedField != null)
          for (Annotation localAnnotation : localField.getDeclaredAnnotations())
            if (this._annotationIntrospector.isHandled(localAnnotation))
              localAnnotatedField.addOrOverride(localAnnotation);
      }
    }
  }

  protected void _addFields(Map<String, AnnotatedField> paramMap, Class<?> paramClass)
  {
    Class localClass1 = paramClass.getSuperclass();
    if (localClass1 != null)
    {
      _addFields(paramMap, localClass1);
      Field[] arrayOfField = paramClass.getDeclaredFields();
      int i = arrayOfField.length;
      int j = 0;
      if (j < i)
      {
        Field localField = arrayOfField[j];
        if (!_isIncludableField(localField));
        while (true)
        {
          j++;
          break;
          paramMap.put(localField.getName(), _constructField(localField));
        }
      }
      if (this._mixInResolver != null)
      {
        Class localClass2 = this._mixInResolver.findMixInClassFor(paramClass);
        if (localClass2 != null)
          _addFieldMixIns(localClass2, paramMap);
      }
    }
  }

  protected void _addMemberMethods(Class<?> paramClass1, MethodFilter paramMethodFilter, AnnotatedMethodMap paramAnnotatedMethodMap1, Class<?> paramClass2, AnnotatedMethodMap paramAnnotatedMethodMap2)
  {
    if (paramClass2 != null)
      _addMethodMixIns(paramMethodFilter, paramAnnotatedMethodMap1, paramClass2, paramAnnotatedMethodMap2);
    if (paramClass1 == null)
      return;
    Method[] arrayOfMethod = paramClass1.getDeclaredMethods();
    int i = arrayOfMethod.length;
    int j = 0;
    label34: Method localMethod;
    if (j < i)
    {
      localMethod = arrayOfMethod[j];
      if (_isIncludableMethod(localMethod, paramMethodFilter))
        break label64;
    }
    while (true)
    {
      j++;
      break label34;
      break;
      label64: AnnotatedMethod localAnnotatedMethod1 = paramAnnotatedMethodMap1.find(localMethod);
      if (localAnnotatedMethod1 == null)
      {
        AnnotatedMethod localAnnotatedMethod2 = _constructMethod(localMethod);
        paramAnnotatedMethodMap1.add(localAnnotatedMethod2);
        AnnotatedMethod localAnnotatedMethod3 = paramAnnotatedMethodMap2.remove(localMethod);
        if (localAnnotatedMethod3 != null)
          _addMixOvers(localAnnotatedMethod3.getAnnotated(), localAnnotatedMethod2, false);
      }
      else
      {
        _addMixUnders(localMethod, localAnnotatedMethod1);
        if ((localAnnotatedMethod1.getDeclaringClass().isInterface()) && (!localMethod.getDeclaringClass().isInterface()))
          paramAnnotatedMethodMap1.add(localAnnotatedMethod1.withMethod(localMethod));
      }
    }
  }

  protected void _addMethodMixIns(MethodFilter paramMethodFilter, AnnotatedMethodMap paramAnnotatedMethodMap1, Class<?> paramClass, AnnotatedMethodMap paramAnnotatedMethodMap2)
  {
    Method[] arrayOfMethod = paramClass.getDeclaredMethods();
    int i = arrayOfMethod.length;
    int j = 0;
    if (j < i)
    {
      Method localMethod = arrayOfMethod[j];
      if (!_isIncludableMethod(localMethod, paramMethodFilter));
      while (true)
      {
        j++;
        break;
        AnnotatedMethod localAnnotatedMethod = paramAnnotatedMethodMap1.find(localMethod);
        if (localAnnotatedMethod != null)
          _addMixUnders(localMethod, localAnnotatedMethod);
        else
          paramAnnotatedMethodMap2.add(_constructMethod(localMethod));
      }
    }
  }

  protected void _addMixOvers(Constructor<?> paramConstructor, AnnotatedConstructor paramAnnotatedConstructor, boolean paramBoolean)
  {
    for (Annotation localAnnotation : paramConstructor.getDeclaredAnnotations())
      if (this._annotationIntrospector.isHandled(localAnnotation))
        paramAnnotatedConstructor.addOrOverride(localAnnotation);
    if (paramBoolean)
    {
      Annotation[][] arrayOfAnnotation = paramConstructor.getParameterAnnotations();
      int k = 0;
      int m = arrayOfAnnotation.length;
      while (k < m)
      {
        Annotation[] arrayOfAnnotation2 = arrayOfAnnotation[k];
        int n = arrayOfAnnotation2.length;
        for (int i1 = 0; i1 < n; i1++)
          paramAnnotatedConstructor.addOrOverrideParam(k, arrayOfAnnotation2[i1]);
        k++;
      }
    }
  }

  protected void _addMixOvers(Method paramMethod, AnnotatedMethod paramAnnotatedMethod, boolean paramBoolean)
  {
    for (Annotation localAnnotation : paramMethod.getDeclaredAnnotations())
      if (this._annotationIntrospector.isHandled(localAnnotation))
        paramAnnotatedMethod.addOrOverride(localAnnotation);
    if (paramBoolean)
    {
      Annotation[][] arrayOfAnnotation = paramMethod.getParameterAnnotations();
      int k = 0;
      int m = arrayOfAnnotation.length;
      while (k < m)
      {
        Annotation[] arrayOfAnnotation2 = arrayOfAnnotation[k];
        int n = arrayOfAnnotation2.length;
        for (int i1 = 0; i1 < n; i1++)
          paramAnnotatedMethod.addOrOverrideParam(k, arrayOfAnnotation2[i1]);
        k++;
      }
    }
  }

  protected void _addMixUnders(Method paramMethod, AnnotatedMethod paramAnnotatedMethod)
  {
    for (Annotation localAnnotation : paramMethod.getDeclaredAnnotations())
      if (this._annotationIntrospector.isHandled(localAnnotation))
        paramAnnotatedMethod.addIfNotPresent(localAnnotation);
  }

  protected AnnotationMap _collectRelevantAnnotations(Annotation[] paramArrayOfAnnotation)
  {
    AnnotationMap localAnnotationMap = new AnnotationMap();
    if (paramArrayOfAnnotation != null)
    {
      int i = paramArrayOfAnnotation.length;
      for (int j = 0; j < i; j++)
      {
        Annotation localAnnotation = paramArrayOfAnnotation[j];
        if (this._annotationIntrospector.isHandled(localAnnotation))
          localAnnotationMap.add(localAnnotation);
      }
    }
    return localAnnotationMap;
  }

  protected AnnotationMap[] _collectRelevantAnnotations(Annotation[][] paramArrayOfAnnotation)
  {
    int i = paramArrayOfAnnotation.length;
    AnnotationMap[] arrayOfAnnotationMap = new AnnotationMap[i];
    for (int j = 0; j < i; j++)
      arrayOfAnnotationMap[j] = _collectRelevantAnnotations(paramArrayOfAnnotation[j]);
    return arrayOfAnnotationMap;
  }

  protected AnnotatedConstructor _constructConstructor(Constructor<?> paramConstructor, boolean paramBoolean)
  {
    if (this._annotationIntrospector == null)
      return new AnnotatedConstructor(paramConstructor, _emptyAnnotationMap(), _emptyAnnotationMaps(paramConstructor.getParameterTypes().length));
    if (paramBoolean)
      return new AnnotatedConstructor(paramConstructor, _collectRelevantAnnotations(paramConstructor.getDeclaredAnnotations()), null);
    Object localObject1 = paramConstructor.getParameterAnnotations();
    int i = paramConstructor.getParameterTypes().length;
    if (i != localObject1.length)
    {
      Class localClass = paramConstructor.getDeclaringClass();
      if ((localClass.isEnum()) && (i == 2 + localObject1.length))
      {
        Object localObject3 = localObject1;
        localObject1 = new Annotation[2 + localObject3.length][];
        System.arraycopy(localObject3, 0, localObject1, 2, localObject3.length);
        arrayOfAnnotationMap = _collectRelevantAnnotations((Annotation[][])localObject1);
      }
      while (arrayOfAnnotationMap == null)
      {
        throw new IllegalStateException("Internal error: constructor for " + paramConstructor.getDeclaringClass().getName() + " has mismatch: " + i + " parameters; " + localObject1.length + " sets of annotations");
        boolean bool = localClass.isMemberClass();
        arrayOfAnnotationMap = null;
        if (bool)
        {
          int j = 1 + localObject1.length;
          arrayOfAnnotationMap = null;
          if (i == j)
          {
            Object localObject2 = localObject1;
            localObject1 = new Annotation[1 + localObject2.length][];
            System.arraycopy(localObject2, 0, localObject1, 1, localObject2.length);
            arrayOfAnnotationMap = _collectRelevantAnnotations((Annotation[][])localObject1);
          }
        }
      }
    }
    AnnotationMap[] arrayOfAnnotationMap = _collectRelevantAnnotations((Annotation[][])localObject1);
    return new AnnotatedConstructor(paramConstructor, _collectRelevantAnnotations(paramConstructor.getDeclaredAnnotations()), arrayOfAnnotationMap);
  }

  protected AnnotatedMethod _constructCreatorMethod(Method paramMethod)
  {
    if (this._annotationIntrospector == null)
      return new AnnotatedMethod(paramMethod, _emptyAnnotationMap(), _emptyAnnotationMaps(paramMethod.getParameterTypes().length));
    return new AnnotatedMethod(paramMethod, _collectRelevantAnnotations(paramMethod.getDeclaredAnnotations()), _collectRelevantAnnotations(paramMethod.getParameterAnnotations()));
  }

  protected AnnotatedField _constructField(Field paramField)
  {
    if (this._annotationIntrospector == null)
      return new AnnotatedField(paramField, _emptyAnnotationMap());
    return new AnnotatedField(paramField, _collectRelevantAnnotations(paramField.getDeclaredAnnotations()));
  }

  protected AnnotatedMethod _constructMethod(Method paramMethod)
  {
    if (this._annotationIntrospector == null)
      return new AnnotatedMethod(paramMethod, _emptyAnnotationMap(), null);
    return new AnnotatedMethod(paramMethod, _collectRelevantAnnotations(paramMethod.getDeclaredAnnotations()), null);
  }

  protected boolean _isIncludableMethod(Method paramMethod, MethodFilter paramMethodFilter)
  {
    if ((paramMethodFilter != null) && (!paramMethodFilter.includeMethod(paramMethod)));
    while ((paramMethod.isSynthetic()) || (paramMethod.isBridge()))
      return false;
    return true;
  }

  public Iterable<AnnotatedField> fields()
  {
    if (this._fields == null)
      return Collections.emptyList();
    return this._fields;
  }

  public AnnotatedMethod findMethod(String paramString, Class<?>[] paramArrayOfClass)
  {
    return this._memberMethods.find(paramString, paramArrayOfClass);
  }

  protected AnnotationMap getAllAnnotations()
  {
    return this._classAnnotations;
  }

  public Class<?> getAnnotated()
  {
    return this._class;
  }

  public <A extends Annotation> A getAnnotation(Class<A> paramClass)
  {
    if (this._classAnnotations == null)
      return null;
    return this._classAnnotations.get(paramClass);
  }

  public Annotations getAnnotations()
  {
    return this._classAnnotations;
  }

  public List<AnnotatedConstructor> getConstructors()
  {
    if (this._constructors == null)
      return Collections.emptyList();
    return this._constructors;
  }

  public AnnotatedConstructor getDefaultConstructor()
  {
    return this._defaultConstructor;
  }

  public int getFieldCount()
  {
    if (this._fields == null)
      return 0;
    return this._fields.size();
  }

  public Type getGenericType()
  {
    return this._class;
  }

  public int getMemberMethodCount()
  {
    return this._memberMethods.size();
  }

  public int getModifiers()
  {
    return this._class.getModifiers();
  }

  public String getName()
  {
    return this._class.getName();
  }

  public Class<?> getRawType()
  {
    return this._class;
  }

  public List<AnnotatedMethod> getStaticMethods()
  {
    if (this._creatorMethods == null)
      return Collections.emptyList();
    return this._creatorMethods;
  }

  public boolean hasAnnotations()
  {
    return this._classAnnotations.size() > 0;
  }

  public Iterable<AnnotatedMethod> memberMethods()
  {
    return this._memberMethods;
  }

  public void resolveClassAnnotations()
  {
    this._classAnnotations = new AnnotationMap();
    if (this._annotationIntrospector == null)
      return;
    if (this._primaryMixIn != null)
      _addClassMixIns(this._classAnnotations, this._class, this._primaryMixIn);
    for (Annotation localAnnotation2 : this._class.getDeclaredAnnotations())
      if (this._annotationIntrospector.isHandled(localAnnotation2))
        this._classAnnotations.addIfNotPresent(localAnnotation2);
    Iterator localIterator = this._superTypes.iterator();
    while (localIterator.hasNext())
    {
      Class localClass = (Class)localIterator.next();
      _addClassMixIns(this._classAnnotations, localClass);
      for (Annotation localAnnotation1 : localClass.getDeclaredAnnotations())
        if (this._annotationIntrospector.isHandled(localAnnotation1))
          this._classAnnotations.addIfNotPresent(localAnnotation1);
    }
    _addClassMixIns(this._classAnnotations, Object.class);
  }

  public void resolveCreators(boolean paramBoolean)
  {
    this._constructors = null;
    Constructor[] arrayOfConstructor = this._class.getDeclaredConstructors();
    int i = arrayOfConstructor.length;
    int j = 0;
    if (j < i)
    {
      Constructor localConstructor = arrayOfConstructor[j];
      if (localConstructor.getParameterTypes().length == 0)
        this._defaultConstructor = _constructConstructor(localConstructor, true);
      while (true)
      {
        j++;
        break;
        if (paramBoolean)
        {
          if (this._constructors == null)
            this._constructors = new ArrayList(Math.max(10, arrayOfConstructor.length));
          this._constructors.add(_constructConstructor(localConstructor, false));
        }
      }
    }
    if ((this._primaryMixIn != null) && ((this._defaultConstructor != null) || (this._constructors != null)))
      _addConstructorMixIns(this._primaryMixIn);
    if (this._annotationIntrospector != null)
    {
      if ((this._defaultConstructor != null) && (this._annotationIntrospector.isIgnorableConstructor(this._defaultConstructor)))
        this._defaultConstructor = null;
      if (this._constructors != null)
      {
        int i1 = this._constructors.size();
        while (true)
        {
          i1--;
          if (i1 < 0)
            break;
          if (this._annotationIntrospector.isIgnorableConstructor((AnnotatedConstructor)this._constructors.get(i1)))
            this._constructors.remove(i1);
        }
      }
    }
    this._creatorMethods = null;
    if (paramBoolean)
    {
      Method[] arrayOfMethod = this._class.getDeclaredMethods();
      int k = arrayOfMethod.length;
      int m = 0;
      if (m < k)
      {
        Method localMethod = arrayOfMethod[m];
        if (!Modifier.isStatic(localMethod.getModifiers()));
        while (true)
        {
          m++;
          break;
          if (localMethod.getParameterTypes().length >= 1)
          {
            if (this._creatorMethods == null)
              this._creatorMethods = new ArrayList(8);
            this._creatorMethods.add(_constructCreatorMethod(localMethod));
          }
        }
      }
      if ((this._primaryMixIn != null) && (this._creatorMethods != null))
        _addFactoryMixIns(this._primaryMixIn);
      if ((this._annotationIntrospector != null) && (this._creatorMethods != null))
      {
        int n = this._creatorMethods.size();
        while (true)
        {
          n--;
          if (n < 0)
            break;
          if (this._annotationIntrospector.isIgnorableMethod((AnnotatedMethod)this._creatorMethods.get(n)))
            this._creatorMethods.remove(n);
        }
      }
    }
  }

  public void resolveFields()
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    _addFields(localLinkedHashMap, this._class);
    if (localLinkedHashMap.isEmpty())
    {
      this._fields = Collections.emptyList();
      return;
    }
    this._fields = new ArrayList(localLinkedHashMap.size());
    this._fields.addAll(localLinkedHashMap.values());
  }

  @Deprecated
  public void resolveFields(boolean paramBoolean)
  {
    resolveFields();
  }

  public void resolveMemberMethods(MethodFilter paramMethodFilter)
  {
    this._memberMethods = new AnnotatedMethodMap();
    AnnotatedMethodMap localAnnotatedMethodMap = new AnnotatedMethodMap();
    _addMemberMethods(this._class, paramMethodFilter, this._memberMethods, this._primaryMixIn, localAnnotatedMethodMap);
    Iterator localIterator1 = this._superTypes.iterator();
    if (localIterator1.hasNext())
    {
      Class localClass2 = (Class)localIterator1.next();
      if (this._mixInResolver == null);
      for (Class localClass3 = null; ; localClass3 = this._mixInResolver.findMixInClassFor(localClass2))
      {
        _addMemberMethods(localClass2, paramMethodFilter, this._memberMethods, localClass3, localAnnotatedMethodMap);
        break;
      }
    }
    if (this._mixInResolver != null)
    {
      Class localClass1 = this._mixInResolver.findMixInClassFor(Object.class);
      if (localClass1 != null)
        _addMethodMixIns(paramMethodFilter, this._memberMethods, localClass1, localAnnotatedMethodMap);
    }
    if ((this._annotationIntrospector != null) && (!localAnnotatedMethodMap.isEmpty()))
    {
      Iterator localIterator2 = localAnnotatedMethodMap.iterator();
      while (localIterator2.hasNext())
      {
        AnnotatedMethod localAnnotatedMethod1 = (AnnotatedMethod)localIterator2.next();
        try
        {
          Method localMethod = Object.class.getDeclaredMethod(localAnnotatedMethod1.getName(), localAnnotatedMethod1.getParameterClasses());
          if (localMethod != null)
          {
            AnnotatedMethod localAnnotatedMethod2 = _constructMethod(localMethod);
            _addMixOvers(localAnnotatedMethod1.getAnnotated(), localAnnotatedMethod2, false);
            this._memberMethods.add(localAnnotatedMethod2);
          }
        }
        catch (Exception localException)
        {
        }
      }
    }
  }

  @Deprecated
  public void resolveMemberMethods(MethodFilter paramMethodFilter, boolean paramBoolean)
  {
    resolveMemberMethods(paramMethodFilter);
  }

  public String toString()
  {
    return "[AnnotedClass " + this._class.getName() + "]";
  }

  public AnnotatedClass withAnnotations(AnnotationMap paramAnnotationMap)
  {
    return new AnnotatedClass(this._class, this._superTypes, this._annotationIntrospector, this._mixInResolver, paramAnnotationMap);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass
 * JD-Core Version:    0.6.2
 */