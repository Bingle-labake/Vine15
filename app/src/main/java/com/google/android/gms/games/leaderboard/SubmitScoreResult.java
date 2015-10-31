package com.google.android.gms.games.leaderboard;

import com.google.android.gms.internal.bq;
import com.google.android.gms.internal.k;
import com.google.android.gms.internal.w;
import com.google.android.gms.internal.w.a;
import com.google.android.gms.internal.x;
import java.util.HashMap;

public final class SubmitScoreResult
{
  private static final String[] dB = { "leaderboardId", "playerId", "timeSpan", "hasResult", "rawScore", "formattedScore", "newBest" };
  private String cw;
  private String dC;
  private HashMap<Integer, Result> dD;
  private int p;

  public SubmitScoreResult(int paramInt, String paramString1, String paramString2)
  {
    this(paramInt, paramString1, paramString2, new HashMap());
  }

  public SubmitScoreResult(int paramInt, String paramString1, String paramString2, HashMap<Integer, Result> paramHashMap)
  {
    this.p = paramInt;
    this.dC = paramString1;
    this.cw = paramString2;
    this.dD = paramHashMap;
  }

  public SubmitScoreResult(k paramk)
  {
    this.p = paramk.getStatusCode();
    this.dD = new HashMap();
    int j = paramk.getCount();
    if (j == 3);
    for (boolean bool = true; ; bool = false)
    {
      x.c(bool);
      while (i < j)
      {
        int k = paramk.d(i);
        if (i == 0)
        {
          this.dC = paramk.c("leaderboardId", i, k);
          this.cw = paramk.c("playerId", i, k);
        }
        if (paramk.d("hasResult", i, k))
          a(new Result(paramk.a("rawScore", i, k), paramk.c("formattedScore", i, k), paramk.d("newBest", i, k)), paramk.b("timeSpan", i, k));
        i++;
      }
    }
  }

  private void a(Result paramResult, int paramInt)
  {
    this.dD.put(Integer.valueOf(paramInt), paramResult);
  }

  public String getLeaderboardId()
  {
    return this.dC;
  }

  public String getPlayerId()
  {
    return this.cw;
  }

  public Result getScoreResult(int paramInt)
  {
    return (Result)this.dD.get(Integer.valueOf(paramInt));
  }

  public int getStatusCode()
  {
    return this.p;
  }

  public String toString()
  {
    w.a locala = w.c(this).a("PlayerId", this.cw).a("StatusCode", Integer.valueOf(this.p));
    int i = 0;
    if (i < 3)
    {
      Result localResult = (Result)this.dD.get(Integer.valueOf(i));
      locala.a("TimesSpan", bq.B(i));
      if (localResult == null);
      for (String str = "null"; ; str = localResult.toString())
      {
        locala.a("Result", str);
        i++;
        break;
      }
    }
    return locala.toString();
  }

  public static final class Result
  {
    public final String formattedScore;
    public final boolean newBest;
    public final long rawScore;

    public Result(long paramLong, String paramString, boolean paramBoolean)
    {
      this.rawScore = paramLong;
      this.formattedScore = paramString;
      this.newBest = paramBoolean;
    }

    public String toString()
    {
      return w.c(this).a("RawScore", Long.valueOf(this.rawScore)).a("FormattedScore", this.formattedScore).a("NewBest", Boolean.valueOf(this.newBest)).toString();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.games.leaderboard.SubmitScoreResult
 * JD-Core Version:    0.6.2
 */