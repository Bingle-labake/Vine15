package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.AtomicBooleanDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.CalendarDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.ClassDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.DateDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.FromStringDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.JavaTypeDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.BigDecimalDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.BigIntegerDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.BooleanDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.ByteDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.CharacterDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.DoubleDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.FloatDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.IntegerDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.LongDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.NumberDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.ShortDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.SqlDateDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer.StackTraceElementDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.StringDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.TimestampDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.TokenBufferDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.UntypedObjectDeserializer;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;

class StdDeserializers
{
  final HashMap<ClassKey, JsonDeserializer<Object>> _deserializers = new HashMap();

  private StdDeserializers()
  {
    add(new UntypedObjectDeserializer());
    StringDeserializer localStringDeserializer = new StringDeserializer();
    add(localStringDeserializer, String.class);
    add(localStringDeserializer, CharSequence.class);
    add(new ClassDeserializer());
    add(new StdDeserializer.BooleanDeserializer(Boolean.class, null));
    add(new StdDeserializer.ByteDeserializer(Byte.class, null));
    add(new StdDeserializer.ShortDeserializer(Short.class, null));
    add(new StdDeserializer.CharacterDeserializer(Character.class, null));
    add(new StdDeserializer.IntegerDeserializer(Integer.class, null));
    add(new StdDeserializer.LongDeserializer(Long.class, null));
    add(new StdDeserializer.FloatDeserializer(Float.class, null));
    add(new StdDeserializer.DoubleDeserializer(Double.class, null));
    add(new StdDeserializer.BooleanDeserializer(Boolean.TYPE, Boolean.FALSE));
    add(new StdDeserializer.ByteDeserializer(Byte.TYPE, Byte.valueOf((byte)0)));
    add(new StdDeserializer.ShortDeserializer(Short.TYPE, Short.valueOf((short)0)));
    add(new StdDeserializer.CharacterDeserializer(Character.TYPE, Character.valueOf('\000')));
    add(new StdDeserializer.IntegerDeserializer(Integer.TYPE, Integer.valueOf(0)));
    add(new StdDeserializer.LongDeserializer(Long.TYPE, Long.valueOf(0L)));
    add(new StdDeserializer.FloatDeserializer(Float.TYPE, Float.valueOf(0.0F)));
    add(new StdDeserializer.DoubleDeserializer(Double.TYPE, Double.valueOf(0.0D)));
    add(new StdDeserializer.NumberDeserializer());
    add(new StdDeserializer.BigDecimalDeserializer());
    add(new StdDeserializer.BigIntegerDeserializer());
    add(new CalendarDeserializer());
    add(new DateDeserializer());
    add(new CalendarDeserializer(GregorianCalendar.class), GregorianCalendar.class);
    add(new StdDeserializer.SqlDateDeserializer());
    add(new TimestampDeserializer());
    Iterator localIterator = FromStringDeserializer.all().iterator();
    while (localIterator.hasNext())
      add((FromStringDeserializer)localIterator.next());
    add(new StdDeserializer.StackTraceElementDeserializer());
    add(new AtomicBooleanDeserializer());
    add(new TokenBufferDeserializer());
    add(new JavaTypeDeserializer());
  }

  private void add(StdDeserializer<?> paramStdDeserializer)
  {
    add(paramStdDeserializer, paramStdDeserializer.getValueClass());
  }

  private void add(StdDeserializer<?> paramStdDeserializer, Class<?> paramClass)
  {
    this._deserializers.put(new ClassKey(paramClass), paramStdDeserializer);
  }

  public static HashMap<ClassKey, JsonDeserializer<Object>> constructAll()
  {
    return new StdDeserializers()._deserializers;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.StdDeserializers
 * JD-Core Version:    0.6.2
 */