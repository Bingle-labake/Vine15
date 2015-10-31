package com.flurry.org.apache.avro.io.parsing;

import com.flurry.org.apache.avro.AvroTypeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.Schema.Type;
import com.flurry.org.apache.avro.io.BinaryEncoder;
import com.flurry.org.apache.avro.io.Encoder;
import com.flurry.org.apache.avro.io.EncoderFactory;
import com.flurry.org.codehaus.jackson.JsonNode;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ResolvingGrammarGenerator extends ValidatingGrammarGenerator
{
  private static EncoderFactory factory = new EncoderFactory().configureBufferSize(32);

  private static int bestBranch(Schema paramSchema1, Schema paramSchema2)
  {
    Schema.Type localType = paramSchema2.getType();
    int i = 0;
    Iterator localIterator1 = paramSchema1.getTypes().iterator();
    int j;
    Iterator localIterator2;
    while (true)
    {
      if (!localIterator1.hasNext())
      {
        j = 0;
        localIterator2 = paramSchema1.getTypes().iterator();
        if (localIterator2.hasNext())
          break;
        return -1;
      }
      Schema localSchema1 = (Schema)localIterator1.next();
      if (localType == localSchema1.getType())
        if ((localType == Schema.Type.RECORD) || (localType == Schema.Type.ENUM) || (localType == Schema.Type.FIXED))
        {
          String str1 = paramSchema2.getFullName();
          String str2 = localSchema1.getFullName();
          if (((str1 != null) && (str1.equals(str2))) || ((str1 == str2) && (localType == Schema.Type.RECORD)))
            return i;
        }
        else
        {
          return i;
        }
      i++;
    }
    Schema localSchema2 = (Schema)localIterator2.next();
    switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localType.ordinal()])
    {
    default:
    case 9:
    case 10:
    case 11:
    }
    while (true)
    {
      j++;
      break;
      switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localSchema2.getType().ordinal()])
      {
      case 11:
      default:
        break;
      case 10:
      case 12:
        return j;
        switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localSchema2.getType().ordinal()])
        {
        default:
        case 12:
        }
        break;
      }
    }
    return j;
  }

  public static void encode(Encoder paramEncoder, Schema paramSchema, JsonNode paramJsonNode)
    throws IOException
  {
    switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[paramSchema.getType().ordinal()])
    {
    default:
      return;
    case 1:
      Iterator localIterator3 = paramSchema.getFields().iterator();
      while (localIterator3.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator3.next();
        String str2 = localField.name();
        JsonNode localJsonNode2 = paramJsonNode.get(str2);
        if (localJsonNode2 == null)
          localJsonNode2 = localField.defaultValue();
        if (localJsonNode2 == null)
          throw new AvroTypeException("No default value for: " + str2);
        encode(paramEncoder, localField.schema(), localJsonNode2);
      }
    case 2:
      paramEncoder.writeEnum(paramSchema.getEnumOrdinal(paramJsonNode.getTextValue()));
      return;
    case 3:
      paramEncoder.writeArrayStart();
      paramEncoder.setItemCount(paramJsonNode.size());
      Schema localSchema2 = paramSchema.getElementType();
      Iterator localIterator2 = paramJsonNode.iterator();
      while (true)
      {
        if (!localIterator2.hasNext())
        {
          paramEncoder.writeArrayEnd();
          return;
        }
        JsonNode localJsonNode1 = (JsonNode)localIterator2.next();
        paramEncoder.startItem();
        encode(paramEncoder, localSchema2, localJsonNode1);
      }
    case 4:
      paramEncoder.writeMapStart();
      paramEncoder.setItemCount(paramJsonNode.size());
      Schema localSchema1 = paramSchema.getValueType();
      Iterator localIterator1 = paramJsonNode.getFieldNames();
      while (true)
      {
        if (!localIterator1.hasNext())
        {
          paramEncoder.writeMapEnd();
          return;
        }
        paramEncoder.startItem();
        String str1 = (String)localIterator1.next();
        paramEncoder.writeString(str1);
        encode(paramEncoder, localSchema1, paramJsonNode.get(str1));
      }
    case 5:
      paramEncoder.writeIndex(0);
      encode(paramEncoder, (Schema)paramSchema.getTypes().get(0), paramJsonNode);
      return;
    case 6:
      if (!paramJsonNode.isTextual())
        throw new AvroTypeException("Non-string default value for fixed: " + paramJsonNode);
      Object localObject = paramJsonNode.getTextValue().getBytes("ISO-8859-1");
      byte[] arrayOfByte;
      if (localObject.length != paramSchema.getFixedSize())
      {
        arrayOfByte = new byte[paramSchema.getFixedSize()];
        if (paramSchema.getFixedSize() <= localObject.length)
          break label456;
      }
      for (int i = localObject.length; ; i = paramSchema.getFixedSize())
      {
        System.arraycopy(localObject, 0, arrayOfByte, 0, i);
        localObject = arrayOfByte;
        paramEncoder.writeFixed((byte[])localObject);
        return;
      }
    case 7:
      if (!paramJsonNode.isTextual())
        throw new AvroTypeException("Non-string default value for string: " + paramJsonNode);
      paramEncoder.writeString(paramJsonNode.getTextValue());
      return;
    case 8:
      if (!paramJsonNode.isTextual())
        throw new AvroTypeException("Non-string default value for bytes: " + paramJsonNode);
      paramEncoder.writeBytes(paramJsonNode.getTextValue().getBytes("ISO-8859-1"));
      return;
    case 9:
      if (!paramJsonNode.isNumber())
        throw new AvroTypeException("Non-numeric default value for int: " + paramJsonNode);
      paramEncoder.writeInt(paramJsonNode.getIntValue());
      return;
    case 10:
      if (!paramJsonNode.isNumber())
        throw new AvroTypeException("Non-numeric default value for long: " + paramJsonNode);
      paramEncoder.writeLong(paramJsonNode.getLongValue());
      return;
    case 11:
      if (!paramJsonNode.isNumber())
        throw new AvroTypeException("Non-numeric default value for float: " + paramJsonNode);
      paramEncoder.writeFloat((float)paramJsonNode.getDoubleValue());
      return;
    case 12:
      if (!paramJsonNode.isNumber())
        throw new AvroTypeException("Non-numeric default value for double: " + paramJsonNode);
      paramEncoder.writeDouble(paramJsonNode.getDoubleValue());
      return;
    case 13:
      label456: if (!paramJsonNode.isBoolean())
        throw new AvroTypeException("Non-boolean default for boolean: " + paramJsonNode);
      paramEncoder.writeBoolean(paramJsonNode.getBooleanValue());
      return;
    case 14:
    }
    if (!paramJsonNode.isNull())
      throw new AvroTypeException("Non-null default value for null type: " + paramJsonNode);
    paramEncoder.writeNull();
  }

  private static byte[] getBinary(Schema paramSchema, JsonNode paramJsonNode)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    BinaryEncoder localBinaryEncoder = factory.binaryEncoder(localByteArrayOutputStream, null);
    encode(localBinaryEncoder, paramSchema, paramJsonNode);
    localBinaryEncoder.flush();
    return localByteArrayOutputStream.toByteArray();
  }

  private static Symbol mkEnumAdjust(List<String> paramList1, List<String> paramList2)
  {
    Object[] arrayOfObject = new Object[paramList1.size()];
    int i = 0;
    if (i >= arrayOfObject.length)
      return new Symbol.EnumAdjustAction(paramList2.size(), arrayOfObject);
    int j = paramList2.indexOf(paramList1.get(i));
    if (j == -1);
    for (Object localObject = "No match for " + (String)paramList1.get(i); ; localObject = new Integer(j))
    {
      arrayOfObject[i] = localObject;
      i++;
      break;
    }
  }

  private Symbol resolveRecords(Schema paramSchema1, Schema paramSchema2, Map<ValidatingGrammarGenerator.LitS, Symbol> paramMap)
    throws IOException
  {
    LitS2 localLitS2 = new LitS2(paramSchema1, paramSchema2);
    Symbol localSymbol1 = (Symbol)paramMap.get(localLitS2);
    Schema.Field[] arrayOfField;
    int i;
    int j;
    Iterator localIterator1;
    Iterator localIterator2;
    label95: Symbol[] arrayOfSymbol;
    int n;
    Iterator localIterator3;
    label163: Iterator localIterator4;
    if (localSymbol1 == null)
    {
      List localList1 = paramSchema1.getFields();
      List localList2 = paramSchema2.getFields();
      arrayOfField = new Schema.Field[localList2.size()];
      i = 0;
      j = 1 + localList1.size();
      localIterator1 = localList1.iterator();
      if (localIterator1.hasNext())
        break label195;
      localIterator2 = localList2.iterator();
      if (localIterator2.hasNext())
        break label239;
      arrayOfSymbol = new Symbol[j];
      n = j - 1;
      Symbol.FieldOrderAction localFieldOrderAction = new Symbol.FieldOrderAction(arrayOfField);
      arrayOfSymbol[n] = localFieldOrderAction;
      localSymbol1 = Symbol.seq(arrayOfSymbol);
      paramMap.put(localLitS2, localSymbol1);
      localIterator3 = localList1.iterator();
      if (localIterator3.hasNext())
        break label348;
      localIterator4 = localList2.iterator();
    }
    while (true)
    {
      if (!localIterator4.hasNext())
      {
        return localSymbol1;
        label195: Schema.Field localField1 = paramSchema2.getField(((Schema.Field)localIterator1.next()).name());
        if (localField1 == null)
          break;
        int k = i + 1;
        arrayOfField[i] = localField1;
        i = k;
        break;
        label239: Schema.Field localField2 = (Schema.Field)localIterator2.next();
        if (paramSchema1.getField(localField2.name()) != null)
          break label95;
        if (localField2.defaultValue() == null)
        {
          Symbol localSymbol2 = Symbol.error("Found " + paramSchema1.toString(true) + ", expecting " + paramSchema2.toString(true));
          paramMap.put(localLitS2, localSymbol2);
          return localSymbol2;
        }
        int m = i + 1;
        arrayOfField[i] = localField2;
        j += 3;
        i = m;
        break label95;
        label348: Schema.Field localField3 = (Schema.Field)localIterator3.next();
        Schema.Field localField4 = paramSchema2.getField(localField3.name());
        if (localField4 == null)
        {
          n--;
          arrayOfSymbol[n] = new Symbol.SkipAction(generate(localField3.schema(), localField3.schema(), paramMap));
          break label163;
        }
        n--;
        arrayOfSymbol[n] = generate(localField3.schema(), localField4.schema(), paramMap);
        break label163;
      }
      Schema.Field localField5 = (Schema.Field)localIterator4.next();
      if (paramSchema1.getField(localField5.name()) == null)
      {
        byte[] arrayOfByte = getBinary(localField5.schema(), localField5.defaultValue());
        int i1 = n - 1;
        Symbol.DefaultStartAction localDefaultStartAction = new Symbol.DefaultStartAction(arrayOfByte);
        arrayOfSymbol[i1] = localDefaultStartAction;
        int i2 = i1 - 1;
        arrayOfSymbol[i2] = generate(localField5.schema(), localField5.schema(), paramMap);
        n = i2 - 1;
        arrayOfSymbol[n] = Symbol.DEFAULT_END_ACTION;
      }
    }
  }

  private Symbol resolveUnion(Schema paramSchema1, Schema paramSchema2, Map<ValidatingGrammarGenerator.LitS, Symbol> paramMap)
    throws IOException
  {
    List localList = paramSchema1.getTypes();
    int i = localList.size();
    Symbol[] arrayOfSymbol1 = new Symbol[i];
    String[] arrayOfString = new String[i];
    int j = 0;
    Iterator localIterator = localList.iterator();
    while (true)
    {
      if (!localIterator.hasNext())
      {
        Symbol[] arrayOfSymbol2 = new Symbol[2];
        arrayOfSymbol2[0] = Symbol.alt(arrayOfSymbol1, arrayOfString);
        arrayOfSymbol2[1] = new Symbol.WriterUnionAction();
        return Symbol.seq(arrayOfSymbol2);
      }
      Schema localSchema = (Schema)localIterator.next();
      arrayOfSymbol1[j] = generate(localSchema, paramSchema2, paramMap);
      arrayOfString[j] = localSchema.getFullName();
      j++;
    }
  }

  public final Symbol generate(Schema paramSchema1, Schema paramSchema2)
    throws IOException
  {
    Symbol[] arrayOfSymbol = new Symbol[1];
    arrayOfSymbol[0] = generate(paramSchema1, paramSchema2, new HashMap());
    return Symbol.root(arrayOfSymbol);
  }

  public Symbol generate(Schema paramSchema1, Schema paramSchema2, Map<ValidatingGrammarGenerator.LitS, Symbol> paramMap)
    throws IOException
  {
    Schema.Type localType1 = paramSchema1.getType();
    Schema.Type localType2 = paramSchema2.getType();
    if (localType1 == localType2)
    {
      switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localType1.ordinal()])
      {
      default:
        throw new AvroTypeException("Unkown type for schema: " + localType1);
      case 14:
        return Symbol.NULL;
      case 13:
        return Symbol.BOOLEAN;
      case 9:
        return Symbol.INT;
      case 10:
        return Symbol.LONG;
      case 11:
        return Symbol.FLOAT;
      case 12:
        return Symbol.DOUBLE;
      case 7:
        return Symbol.STRING;
      case 8:
        return Symbol.BYTES;
      case 6:
        if ((!paramSchema1.getFullName().equals(paramSchema2.getFullName())) || (paramSchema1.getFixedSize() != paramSchema2.getFixedSize()))
          break;
        Symbol[] arrayOfSymbol7 = new Symbol[2];
        arrayOfSymbol7[0] = new Symbol.IntCheckAction(paramSchema1.getFixedSize());
        arrayOfSymbol7[1] = Symbol.FIXED;
        return Symbol.seq(arrayOfSymbol7);
      case 2:
        if ((paramSchema1.getFullName() != null) && (!paramSchema1.getFullName().equals(paramSchema2.getFullName())))
          break;
        Symbol[] arrayOfSymbol6 = new Symbol[2];
        arrayOfSymbol6[0] = mkEnumAdjust(paramSchema1.getEnumSymbols(), paramSchema2.getEnumSymbols());
        arrayOfSymbol6[1] = Symbol.ENUM;
        return Symbol.seq(arrayOfSymbol6);
      case 3:
        Symbol[] arrayOfSymbol4 = new Symbol[2];
        Symbol localSymbol3 = Symbol.ARRAY_END;
        Symbol[] arrayOfSymbol5 = new Symbol[1];
        arrayOfSymbol5[0] = generate(paramSchema1.getElementType(), paramSchema2.getElementType(), paramMap);
        arrayOfSymbol4[0] = Symbol.repeat(localSymbol3, arrayOfSymbol5);
        arrayOfSymbol4[1] = Symbol.ARRAY_START;
        return Symbol.seq(arrayOfSymbol4);
      case 4:
        Symbol[] arrayOfSymbol2 = new Symbol[2];
        Symbol localSymbol2 = Symbol.MAP_END;
        Symbol[] arrayOfSymbol3 = new Symbol[2];
        arrayOfSymbol3[0] = generate(paramSchema1.getValueType(), paramSchema2.getValueType(), paramMap);
        arrayOfSymbol3[1] = Symbol.STRING;
        arrayOfSymbol2[0] = Symbol.repeat(localSymbol2, arrayOfSymbol3);
        arrayOfSymbol2[1] = Symbol.MAP_START;
        return Symbol.seq(arrayOfSymbol2);
      case 1:
        return resolveRecords(paramSchema1, paramSchema2, paramMap);
      case 5:
        return resolveUnion(paramSchema1, paramSchema2, paramMap);
      }
    }
    else
    {
      if (localType1 == Schema.Type.UNION)
        return resolveUnion(paramSchema1, paramSchema2, paramMap);
      switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localType2.ordinal()])
      {
      case 6:
      default:
        throw new RuntimeException("Unexpected schema type: " + localType2);
      case 10:
        switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localType1.ordinal()])
        {
        default:
        case 9:
        }
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 13:
      case 14:
      case 11:
      case 12:
      case 5:
      }
    }
    int i;
    do
    {
      while (true)
      {
        return Symbol.error("Found " + paramSchema1.toString(true) + ", expecting " + paramSchema2.toString(true));
        return Symbol.resolve(super.generate(paramSchema1, paramMap), Symbol.LONG);
        switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localType1.ordinal()])
        {
        default:
          break;
        case 9:
        case 10:
          return Symbol.resolve(super.generate(paramSchema1, paramMap), Symbol.FLOAT);
          switch ($SWITCH_TABLE$org$apache$avro$Schema$Type()[localType1.ordinal()])
          {
          default:
          case 9:
          case 10:
          case 11:
          }
          break;
        }
      }
      return Symbol.resolve(super.generate(paramSchema1, paramMap), Symbol.DOUBLE);
      i = bestBranch(paramSchema2, paramSchema1);
    }
    while (i < 0);
    Symbol localSymbol1 = generate(paramSchema1, (Schema)paramSchema2.getTypes().get(i), paramMap);
    Symbol[] arrayOfSymbol1 = new Symbol[2];
    arrayOfSymbol1[0] = new Symbol.UnionAdjustAction(i, localSymbol1);
    arrayOfSymbol1[1] = Symbol.UNION;
    return Symbol.seq(arrayOfSymbol1);
  }

  static class LitS2 extends ValidatingGrammarGenerator.LitS
  {
    public Schema expected;

    public LitS2(Schema paramSchema1, Schema paramSchema2)
    {
      super();
      this.expected = paramSchema2;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof LitS2));
      LitS2 localLitS2;
      do
      {
        return false;
        localLitS2 = (LitS2)paramObject;
      }
      while ((this.actual != localLitS2.actual) || (this.expected != localLitS2.expected));
      return true;
    }

    public int hashCode()
    {
      return super.hashCode() + this.expected.hashCode();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.parsing.ResolvingGrammarGenerator
 * JD-Core Version:    0.6.2
 */