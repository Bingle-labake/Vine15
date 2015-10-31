package com.flurry.org.codehaus.jackson.map.introspect;

import com.flurry.org.codehaus.jackson.map.BeanPropertyDefinition;

public class POJOPropertyBuilder extends BeanPropertyDefinition
  implements Comparable<POJOPropertyBuilder>
{
  protected Node<AnnotatedParameter> _ctorParameters;
  protected Node<AnnotatedField> _fields;
  protected Node<AnnotatedMethod> _getters;
  protected final String _internalName;
  protected final String _name;
  protected Node<AnnotatedMethod> _setters;

  public POJOPropertyBuilder(POJOPropertyBuilder paramPOJOPropertyBuilder, String paramString)
  {
    this._internalName = paramPOJOPropertyBuilder._internalName;
    this._name = paramString;
    this._fields = paramPOJOPropertyBuilder._fields;
    this._ctorParameters = paramPOJOPropertyBuilder._ctorParameters;
    this._getters = paramPOJOPropertyBuilder._getters;
    this._setters = paramPOJOPropertyBuilder._setters;
  }

  public POJOPropertyBuilder(String paramString)
  {
    this._internalName = paramString;
    this._name = paramString;
  }

  private <T> boolean _anyExplicitNames(Node<T> paramNode)
  {
    while (paramNode != null)
    {
      if ((paramNode.explicitName != null) && (paramNode.explicitName.length() > 0))
        return true;
      paramNode = paramNode.next;
    }
    return false;
  }

  private <T> boolean _anyIgnorals(Node<T> paramNode)
  {
    while (paramNode != null)
    {
      if (paramNode.isMarkedIgnored)
        return true;
      paramNode = paramNode.next;
    }
    return false;
  }

  private <T> boolean _anyVisible(Node<T> paramNode)
  {
    while (paramNode != null)
    {
      if (paramNode.isVisible)
        return true;
      paramNode = paramNode.next;
    }
    return false;
  }

  private AnnotationMap _mergeAnnotations(int paramInt, Node<? extends AnnotatedMember>[] paramArrayOfNode)
  {
    AnnotationMap localAnnotationMap = ((AnnotatedMember)paramArrayOfNode[paramInt].value).getAllAnnotations();
    for (int i = paramInt + 1; ; i++)
      if (i < paramArrayOfNode.length)
      {
        if (paramArrayOfNode[i] != null)
          localAnnotationMap = AnnotationMap.merge(localAnnotationMap, _mergeAnnotations(i, paramArrayOfNode));
      }
      else
        return localAnnotationMap;
  }

  private <T> Node<T> _removeIgnored(Node<T> paramNode)
  {
    if (paramNode == null)
      return paramNode;
    return paramNode.withoutIgnored();
  }

  private <T> Node<T> _removeNonVisible(Node<T> paramNode)
  {
    if (paramNode == null)
      return paramNode;
    return paramNode.withoutNonVisible();
  }

  private <T> Node<T> _trimByVisibility(Node<T> paramNode)
  {
    if (paramNode == null)
      return paramNode;
    return paramNode.trimByVisibility();
  }

  private Node<? extends AnnotatedMember> findRenamed(Node<? extends AnnotatedMember> paramNode1, Node<? extends AnnotatedMember> paramNode2)
  {
    if (paramNode1 != null)
    {
      String str = paramNode1.explicitName;
      if (str == null);
      label41: 
      do
        while (true)
        {
          paramNode1 = paramNode1.next;
          break;
          if (!str.equals(this._name))
          {
            if (paramNode2 != null)
              break label41;
            paramNode2 = paramNode1;
          }
        }
      while (str.equals(paramNode2.explicitName));
      throw new IllegalStateException("Conflicting property name definitions: '" + paramNode2.explicitName + "' (for " + paramNode2.value + ") vs '" + paramNode1.explicitName + "' (for " + paramNode1.value + ")");
    }
    return paramNode2;
  }

  private static <T> Node<T> merge(Node<T> paramNode1, Node<T> paramNode2)
  {
    if (paramNode1 == null)
      return paramNode2;
    if (paramNode2 == null)
      return paramNode1;
    return paramNode1.append(paramNode2);
  }

  public void addAll(POJOPropertyBuilder paramPOJOPropertyBuilder)
  {
    this._fields = merge(this._fields, paramPOJOPropertyBuilder._fields);
    this._ctorParameters = merge(this._ctorParameters, paramPOJOPropertyBuilder._ctorParameters);
    this._getters = merge(this._getters, paramPOJOPropertyBuilder._getters);
    this._setters = merge(this._setters, paramPOJOPropertyBuilder._setters);
  }

  public void addCtor(AnnotatedParameter paramAnnotatedParameter, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    this._ctorParameters = new Node(paramAnnotatedParameter, this._ctorParameters, paramString, paramBoolean1, paramBoolean2);
  }

  public void addField(AnnotatedField paramAnnotatedField, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    this._fields = new Node(paramAnnotatedField, this._fields, paramString, paramBoolean1, paramBoolean2);
  }

  public void addGetter(AnnotatedMethod paramAnnotatedMethod, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    this._getters = new Node(paramAnnotatedMethod, this._getters, paramString, paramBoolean1, paramBoolean2);
  }

  public void addSetter(AnnotatedMethod paramAnnotatedMethod, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    this._setters = new Node(paramAnnotatedMethod, this._setters, paramString, paramBoolean1, paramBoolean2);
  }

  public boolean anyDeserializeIgnorals()
  {
    return (_anyIgnorals(this._fields)) || (_anyIgnorals(this._setters)) || (_anyIgnorals(this._ctorParameters));
  }

  public boolean anyExplicitNames()
  {
    return (_anyExplicitNames(this._fields)) || (_anyExplicitNames(this._getters)) || (_anyExplicitNames(this._setters)) || (_anyExplicitNames(this._ctorParameters));
  }

  public boolean anyIgnorals()
  {
    return (_anyIgnorals(this._fields)) || (_anyIgnorals(this._getters)) || (_anyIgnorals(this._setters)) || (_anyIgnorals(this._ctorParameters));
  }

  public boolean anySerializeIgnorals()
  {
    return (_anyIgnorals(this._fields)) || (_anyIgnorals(this._getters));
  }

  public boolean anyVisible()
  {
    return (_anyVisible(this._fields)) || (_anyVisible(this._getters)) || (_anyVisible(this._setters)) || (_anyVisible(this._ctorParameters));
  }

  public int compareTo(POJOPropertyBuilder paramPOJOPropertyBuilder)
  {
    if (this._ctorParameters != null)
    {
      if (paramPOJOPropertyBuilder._ctorParameters == null)
        return -1;
    }
    else if (paramPOJOPropertyBuilder._ctorParameters != null)
      return 1;
    return getName().compareTo(paramPOJOPropertyBuilder.getName());
  }

  public boolean couldSerialize()
  {
    return (this._getters != null) || (this._fields != null);
  }

  public String findNewName()
  {
    Node localNode1 = findRenamed(this._fields, null);
    Node localNode2 = findRenamed(this._getters, localNode1);
    Node localNode3 = findRenamed(this._setters, localNode2);
    Node localNode4 = findRenamed(this._ctorParameters, localNode3);
    if (localNode4 == null)
      return null;
    return localNode4.explicitName;
  }

  public AnnotatedMember getAccessor()
  {
    Object localObject = getGetter();
    if (localObject == null)
      localObject = getField();
    return localObject;
  }

  public AnnotatedParameter getConstructorParameter()
  {
    if (this._ctorParameters == null)
      return null;
    Node localNode = this._ctorParameters;
    do
    {
      if ((((AnnotatedParameter)localNode.value).getOwner() instanceof AnnotatedConstructor))
        return (AnnotatedParameter)localNode.value;
      localNode = localNode.next;
    }
    while (localNode != null);
    return (AnnotatedParameter)this._ctorParameters.value;
  }

  public AnnotatedField getField()
  {
    if (this._fields == null)
    {
      localObject = null;
      return localObject;
    }
    Object localObject = (AnnotatedField)this._fields.value;
    Node localNode = this._fields.next;
    label30: AnnotatedField localAnnotatedField;
    Class localClass1;
    Class localClass2;
    if (localNode != null)
    {
      localAnnotatedField = (AnnotatedField)localNode.value;
      localClass1 = ((AnnotatedField)localObject).getDeclaringClass();
      localClass2 = localAnnotatedField.getDeclaringClass();
      if (localClass1 == localClass2)
        break label91;
      if (!localClass1.isAssignableFrom(localClass2))
        break label81;
      localObject = localAnnotatedField;
    }
    label81: 
    while (localClass2.isAssignableFrom(localClass1))
    {
      localNode = localNode.next;
      break label30;
      break;
    }
    label91: throw new IllegalArgumentException("Multiple fields representing property \"" + getName() + "\": " + ((AnnotatedField)localObject).getFullName() + " vs " + localAnnotatedField.getFullName());
  }

  public AnnotatedMethod getGetter()
  {
    if (this._getters == null)
    {
      localObject = null;
      return localObject;
    }
    Object localObject = (AnnotatedMethod)this._getters.value;
    Node localNode = this._getters.next;
    label30: AnnotatedMethod localAnnotatedMethod;
    Class localClass1;
    Class localClass2;
    if (localNode != null)
    {
      localAnnotatedMethod = (AnnotatedMethod)localNode.value;
      localClass1 = ((AnnotatedMethod)localObject).getDeclaringClass();
      localClass2 = localAnnotatedMethod.getDeclaringClass();
      if (localClass1 == localClass2)
        break label91;
      if (!localClass1.isAssignableFrom(localClass2))
        break label81;
      localObject = localAnnotatedMethod;
    }
    label81: 
    while (localClass2.isAssignableFrom(localClass1))
    {
      localNode = localNode.next;
      break label30;
      break;
    }
    label91: throw new IllegalArgumentException("Conflicting getter definitions for property \"" + getName() + "\": " + ((AnnotatedMethod)localObject).getFullName() + " vs " + localAnnotatedMethod.getFullName());
  }

  public String getInternalName()
  {
    return this._internalName;
  }

  public AnnotatedMember getMutator()
  {
    Object localObject = getConstructorParameter();
    if (localObject == null)
    {
      localObject = getSetter();
      if (localObject == null)
        localObject = getField();
    }
    return localObject;
  }

  public String getName()
  {
    return this._name;
  }

  public AnnotatedMethod getSetter()
  {
    if (this._setters == null)
    {
      localObject = null;
      return localObject;
    }
    Object localObject = (AnnotatedMethod)this._setters.value;
    Node localNode = this._setters.next;
    label30: AnnotatedMethod localAnnotatedMethod;
    Class localClass1;
    Class localClass2;
    if (localNode != null)
    {
      localAnnotatedMethod = (AnnotatedMethod)localNode.value;
      localClass1 = ((AnnotatedMethod)localObject).getDeclaringClass();
      localClass2 = localAnnotatedMethod.getDeclaringClass();
      if (localClass1 == localClass2)
        break label91;
      if (!localClass1.isAssignableFrom(localClass2))
        break label81;
      localObject = localAnnotatedMethod;
    }
    label81: 
    while (localClass2.isAssignableFrom(localClass1))
    {
      localNode = localNode.next;
      break label30;
      break;
    }
    label91: throw new IllegalArgumentException("Conflicting setter definitions for property \"" + getName() + "\": " + ((AnnotatedMethod)localObject).getFullName() + " vs " + localAnnotatedMethod.getFullName());
  }

  public boolean hasConstructorParameter()
  {
    return this._ctorParameters != null;
  }

  public boolean hasField()
  {
    return this._fields != null;
  }

  public boolean hasGetter()
  {
    return this._getters != null;
  }

  public boolean hasSetter()
  {
    return this._setters != null;
  }

  public void mergeAnnotations(boolean paramBoolean)
  {
    if (paramBoolean)
      if (this._getters != null)
      {
        Node[] arrayOfNode5 = new Node[4];
        arrayOfNode5[0] = this._getters;
        arrayOfNode5[1] = this._fields;
        arrayOfNode5[2] = this._ctorParameters;
        arrayOfNode5[3] = this._setters;
        AnnotationMap localAnnotationMap5 = _mergeAnnotations(0, arrayOfNode5);
        this._getters = this._getters.withValue(((AnnotatedMethod)this._getters.value).withAnnotations(localAnnotationMap5));
      }
    do
    {
      do
        return;
      while (this._fields == null);
      Node[] arrayOfNode4 = new Node[3];
      arrayOfNode4[0] = this._fields;
      arrayOfNode4[1] = this._ctorParameters;
      arrayOfNode4[2] = this._setters;
      AnnotationMap localAnnotationMap4 = _mergeAnnotations(0, arrayOfNode4);
      this._fields = this._fields.withValue(((AnnotatedField)this._fields.value).withAnnotations(localAnnotationMap4));
      return;
      if (this._ctorParameters != null)
      {
        Node[] arrayOfNode3 = new Node[4];
        arrayOfNode3[0] = this._ctorParameters;
        arrayOfNode3[1] = this._setters;
        arrayOfNode3[2] = this._fields;
        arrayOfNode3[3] = this._getters;
        AnnotationMap localAnnotationMap3 = _mergeAnnotations(0, arrayOfNode3);
        this._ctorParameters = this._ctorParameters.withValue(((AnnotatedParameter)this._ctorParameters.value).withAnnotations(localAnnotationMap3));
        return;
      }
      if (this._setters != null)
      {
        Node[] arrayOfNode2 = new Node[3];
        arrayOfNode2[0] = this._setters;
        arrayOfNode2[1] = this._fields;
        arrayOfNode2[2] = this._getters;
        AnnotationMap localAnnotationMap2 = _mergeAnnotations(0, arrayOfNode2);
        this._setters = this._setters.withValue(((AnnotatedMethod)this._setters.value).withAnnotations(localAnnotationMap2));
        return;
      }
    }
    while (this._fields == null);
    Node[] arrayOfNode1 = new Node[2];
    arrayOfNode1[0] = this._fields;
    arrayOfNode1[1] = this._getters;
    AnnotationMap localAnnotationMap1 = _mergeAnnotations(0, arrayOfNode1);
    this._fields = this._fields.withValue(((AnnotatedField)this._fields.value).withAnnotations(localAnnotationMap1));
  }

  public void removeIgnored()
  {
    this._fields = _removeIgnored(this._fields);
    this._getters = _removeIgnored(this._getters);
    this._setters = _removeIgnored(this._setters);
    this._ctorParameters = _removeIgnored(this._ctorParameters);
  }

  public void removeNonVisible()
  {
    this._getters = _removeNonVisible(this._getters);
    this._ctorParameters = _removeNonVisible(this._ctorParameters);
    if (this._getters == null)
    {
      this._fields = _removeNonVisible(this._fields);
      this._setters = _removeNonVisible(this._setters);
    }
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[Property '").append(this._name).append("'; ctors: ").append(this._ctorParameters).append(", field(s): ").append(this._fields).append(", getter(s): ").append(this._getters).append(", setter(s): ").append(this._setters);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }

  public void trimByVisibility()
  {
    this._fields = _trimByVisibility(this._fields);
    this._getters = _trimByVisibility(this._getters);
    this._setters = _trimByVisibility(this._setters);
    this._ctorParameters = _trimByVisibility(this._ctorParameters);
  }

  public POJOPropertyBuilder withName(String paramString)
  {
    return new POJOPropertyBuilder(this, paramString);
  }

  private static final class Node<T>
  {
    public final String explicitName;
    public final boolean isMarkedIgnored;
    public final boolean isVisible;
    public final Node<T> next;
    public final T value;

    public Node(T paramT, Node<T> paramNode, String paramString, boolean paramBoolean1, boolean paramBoolean2)
    {
      this.value = paramT;
      this.next = paramNode;
      if (paramString == null);
      for (this.explicitName = null; ; this.explicitName = paramString)
      {
        this.isVisible = paramBoolean1;
        this.isMarkedIgnored = paramBoolean2;
        return;
        if (paramString.length() == 0)
          paramString = null;
      }
    }

    private Node<T> append(Node<T> paramNode)
    {
      if (this.next == null)
        return withNext(paramNode);
      return withNext(this.next.append(paramNode));
    }

    public String toString()
    {
      String str = this.value.toString() + "[visible=" + this.isVisible + "]";
      if (this.next != null)
        str = str + ", " + this.next.toString();
      return str;
    }

    public Node<T> trimByVisibility()
    {
      Node localNode;
      if (this.next == null)
        localNode = this;
      do
      {
        do
        {
          return localNode;
          localNode = this.next.trimByVisibility();
          if (this.explicitName != null)
          {
            if (localNode.explicitName == null)
              return withNext(null);
            return withNext(localNode);
          }
        }
        while (localNode.explicitName != null);
        if (this.isVisible == localNode.isVisible)
          return withNext(localNode);
      }
      while (!this.isVisible);
      return withNext(null);
    }

    public Node<T> withNext(Node<T> paramNode)
    {
      if (paramNode == this.next)
        return this;
      return new Node(this.value, paramNode, this.explicitName, this.isVisible, this.isMarkedIgnored);
    }

    public Node<T> withValue(T paramT)
    {
      if (paramT == this.value)
        return this;
      return new Node(paramT, this.next, this.explicitName, this.isVisible, this.isMarkedIgnored);
    }

    public Node<T> withoutIgnored()
    {
      if (this.isMarkedIgnored)
      {
        if (this.next == null)
          return null;
        return this.next.withoutIgnored();
      }
      if (this.next != null)
      {
        Node localNode = this.next.withoutIgnored();
        if (localNode != this.next)
          return withNext(localNode);
      }
      return this;
    }

    public Node<T> withoutNonVisible()
    {
      if (this.next == null);
      for (Node localNode = null; ; localNode = this.next.withoutNonVisible())
      {
        if (this.isVisible)
          localNode = withNext(localNode);
        return localNode;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.POJOPropertyBuilder
 * JD-Core Version:    0.6.2
 */