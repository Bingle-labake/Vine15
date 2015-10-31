package com.flurry.org.apache.avro.io.parsing;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class JsonGrammarGenerator extends ValidatingGrammarGenerator
{
  public Symbol generate(Schema paramSchema)
  {
    Symbol[] arrayOfSymbol = new Symbol[1];
    arrayOfSymbol[0] = generate(paramSchema, new HashMap());
    return Symbol.root(arrayOfSymbol);
  }

  public Symbol generate(Schema paramSchema, Map<ValidatingGrammarGenerator.LitS, Symbol> paramMap)
  {
    Symbol localSymbol1;
    switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    default:
      throw new RuntimeException("Unexpected schema type");
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
      localSymbol1 = super.generate(paramSchema, paramMap);
    case 11:
    case 12:
    case 13:
    case 14:
    }
    ValidatingGrammarGenerator.LitS localLitS;
    do
    {
      return localSymbol1;
      Symbol[] arrayOfSymbol6 = new Symbol[2];
      arrayOfSymbol6[0] = new Symbol.EnumLabelsAction(paramSchema.getEnumSymbols());
      arrayOfSymbol6[1] = Symbol.ENUM;
      return Symbol.seq(arrayOfSymbol6);
      Symbol[] arrayOfSymbol4 = new Symbol[2];
      Symbol localSymbol4 = Symbol.ARRAY_END;
      Symbol[] arrayOfSymbol5 = new Symbol[2];
      arrayOfSymbol5[0] = Symbol.ITEM_END;
      arrayOfSymbol5[1] = generate(paramSchema.getElementType(), paramMap);
      arrayOfSymbol4[0] = Symbol.repeat(localSymbol4, arrayOfSymbol5);
      arrayOfSymbol4[1] = Symbol.ARRAY_START;
      return Symbol.seq(arrayOfSymbol4);
      Symbol[] arrayOfSymbol2 = new Symbol[2];
      Symbol localSymbol3 = Symbol.MAP_END;
      Symbol[] arrayOfSymbol3 = new Symbol[4];
      arrayOfSymbol3[0] = Symbol.ITEM_END;
      arrayOfSymbol3[1] = generate(paramSchema.getValueType(), paramMap);
      arrayOfSymbol3[2] = Symbol.MAP_KEY_MARKER;
      arrayOfSymbol3[3] = Symbol.STRING;
      arrayOfSymbol2[0] = Symbol.repeat(localSymbol3, arrayOfSymbol3);
      arrayOfSymbol2[1] = Symbol.MAP_START;
      return Symbol.seq(arrayOfSymbol2);
      localLitS = new ValidatingGrammarGenerator.LitS(paramSchema);
      localSymbol1 = (Symbol)paramMap.get(localLitS);
    }
    while (localSymbol1 != null);
    Symbol[] arrayOfSymbol1 = new Symbol[2 + 3 * paramSchema.getFields().size()];
    Symbol localSymbol2 = Symbol.seq(arrayOfSymbol1);
    paramMap.put(localLitS, localSymbol2);
    int i = arrayOfSymbol1.length;
    int j = 0;
    int k = i - 1;
    arrayOfSymbol1[k] = Symbol.RECORD_START;
    Iterator localIterator = paramSchema.getFields().iterator();
    while (localIterator.hasNext())
    {
      Schema.Field localField = (Schema.Field)localIterator.next();
      int m = k - 1;
      arrayOfSymbol1[m] = new Symbol.FieldAdjustAction(j, localField.name());
      int n = m - 1;
      arrayOfSymbol1[n] = generate(localField.schema(), paramMap);
      k = n - 1;
      arrayOfSymbol1[k] = Symbol.FIELD_END;
      j++;
    }
    arrayOfSymbol1[(k - 1)] = Symbol.RECORD_END;
    return localSymbol2;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.parsing.JsonGrammarGenerator
 * JD-Core Version:    0.6.2
 */