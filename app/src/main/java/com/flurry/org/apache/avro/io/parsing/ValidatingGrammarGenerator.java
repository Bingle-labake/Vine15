package com.flurry.org.apache.avro.io.parsing;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class ValidatingGrammarGenerator
{
  public Symbol generate(Schema paramSchema)
  {
    Symbol[] arrayOfSymbol = new Symbol[1];
    arrayOfSymbol[0] = generate(paramSchema, new HashMap());
    return Symbol.root(arrayOfSymbol);
  }

  public Symbol generate(Schema paramSchema, Map<LitS, Symbol> paramMap)
  {
    Symbol localSymbol1;
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
      throw new RuntimeException("Unexpected schema type");
    case 1:
      localSymbol1 = Symbol.NULL;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      LitS localLitS;
      do
      {
        return localSymbol1;
        return Symbol.BOOLEAN;
        return Symbol.INT;
        return Symbol.LONG;
        return Symbol.FLOAT;
        return Symbol.DOUBLE;
        return Symbol.STRING;
        return Symbol.BYTES;
        Symbol[] arrayOfSymbol9 = new Symbol[2];
        arrayOfSymbol9[0] = new Symbol.IntCheckAction(paramSchema.getFixedSize());
        arrayOfSymbol9[1] = Symbol.FIXED;
        return Symbol.seq(arrayOfSymbol9);
        Symbol[] arrayOfSymbol8 = new Symbol[2];
        arrayOfSymbol8[0] = new Symbol.IntCheckAction(paramSchema.getEnumSymbols().size());
        arrayOfSymbol8[1] = Symbol.ENUM;
        return Symbol.seq(arrayOfSymbol8);
        Symbol[] arrayOfSymbol6 = new Symbol[2];
        Symbol localSymbol3 = Symbol.ARRAY_END;
        Symbol[] arrayOfSymbol7 = new Symbol[1];
        arrayOfSymbol7[0] = generate(paramSchema.getElementType(), paramMap);
        arrayOfSymbol6[0] = Symbol.repeat(localSymbol3, arrayOfSymbol7);
        arrayOfSymbol6[1] = Symbol.ARRAY_START;
        return Symbol.seq(arrayOfSymbol6);
        Symbol[] arrayOfSymbol4 = new Symbol[2];
        Symbol localSymbol2 = Symbol.MAP_END;
        Symbol[] arrayOfSymbol5 = new Symbol[2];
        arrayOfSymbol5[0] = generate(paramSchema.getValueType(), paramMap);
        arrayOfSymbol5[1] = Symbol.STRING;
        arrayOfSymbol4[0] = Symbol.repeat(localSymbol2, arrayOfSymbol5);
        arrayOfSymbol4[1] = Symbol.MAP_START;
        return Symbol.seq(arrayOfSymbol4);
        localLitS = new LitS(paramSchema);
        localSymbol1 = (Symbol)paramMap.get(localLitS);
      }
      while (localSymbol1 != null);
      Symbol[] arrayOfSymbol3 = new Symbol[paramSchema.getFields().size()];
      localSymbol1 = Symbol.seq(arrayOfSymbol3);
      paramMap.put(localLitS, localSymbol1);
      int j = arrayOfSymbol3.length;
      Iterator localIterator2 = paramSchema.getFields().iterator();
      while (localIterator2.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator2.next();
        j--;
        arrayOfSymbol3[j] = generate(localField.schema(), paramMap);
      }
    case 14:
    }
    List localList = paramSchema.getTypes();
    Symbol[] arrayOfSymbol1 = new Symbol[localList.size()];
    String[] arrayOfString = new String[localList.size()];
    int i = 0;
    Iterator localIterator1 = paramSchema.getTypes().iterator();
    while (localIterator1.hasNext())
    {
      Schema localSchema = (Schema)localIterator1.next();
      arrayOfSymbol1[i] = generate(localSchema, paramMap);
      arrayOfString[i] = localSchema.getFullName();
      i++;
    }
    Symbol[] arrayOfSymbol2 = new Symbol[2];
    arrayOfSymbol2[0] = Symbol.alt(arrayOfSymbol1, arrayOfString);
    arrayOfSymbol2[1] = Symbol.UNION;
    return Symbol.seq(arrayOfSymbol2);
  }

  static class LitS
  {
    public final Schema actual;

    public LitS(Schema paramSchema)
    {
      this.actual = paramSchema;
    }

    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof LitS));
      while (this.actual != ((LitS)paramObject).actual)
        return false;
      return true;
    }

    public int hashCode()
    {
      return this.actual.hashCode();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.parsing.ValidatingGrammarGenerator
 * JD-Core Version:    0.6.2
 */