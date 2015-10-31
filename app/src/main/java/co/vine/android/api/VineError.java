package co.vine.android.api;

import android.content.Context;

public class VineError
{
  public final String data;
  public final int errorCode;
  public final String message;

  public VineError(int paramInt, String paramString)
  {
    this(paramInt, paramString, null);
  }

  public VineError(int paramInt, String paramString1, String paramString2)
  {
    this.errorCode = paramInt;
    this.message = paramString1;
    this.data = paramString2;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool = true;
    if (paramObject == null);
    do
    {
      return false;
      if (paramObject.getClass() == getClass())
      {
        if (this.errorCode == ((VineError)paramObject).errorCode);
        while (true)
        {
          return bool;
          bool = false;
        }
      }
    }
    while (!(paramObject instanceof VineKnownErrors));
    if (this.errorCode == ((VineKnownErrors)paramObject).code);
    while (true)
    {
      return bool;
      bool = false;
    }
  }

  public String getLocalizedMessage(Context paramContext)
  {
    VineKnownErrors localVineKnownErrors = VineKnownErrors.valueOf(this.errorCode);
    if (localVineKnownErrors != VineKnownErrors.INVALID_ERROR_CODE)
      return localVineKnownErrors.getMessage(paramContext);
    return this.message;
  }

  public static enum VineKnownErrors
  {
    public final int code;
    public final int message;

    static
    {
      MISSING_REQUIRED_FIELD = new VineKnownErrors("MISSING_REQUIRED_FIELD", 3, 3, 2131623957);
      ACCESS_DENIED = new VineKnownErrors("ACCESS_DENIED", 4, 4, 2131623936);
      INVALID_ARGUMENT = new VineKnownErrors("INVALID_ARGUMENT", 5, 5, 2131623953);
      NON_INTEGER_VALUE = new VineKnownErrors("NON_INTEGER_VALUE", 6, 6, 2131623958);
      REQUIRES_LOGIN = new VineKnownErrors("REQUIRES_LOGIN", 7, 100, 2131623968);
      BAD_CREDENTIALS = new VineKnownErrors("BAD_CREDENTIALS", 8, 101, 2131623940);
      EXPIRED_SESSION = new VineKnownErrors("EXPIRED_SESSION", 9, 102, 2131623949);
      INVALID_SESSION = new VineKnownErrors("INVALID_SESSION", 10, 103, 2131623955);
      FACEBOOK_NOT_AUTHORIZED = new VineKnownErrors("FACEBOOK_NOT_AUTHORIZED", 11, 104, 2131623951);
      TWITTER_NOT_AUTHORIZED = new VineKnownErrors("TWITTER_NOT_AUTHORIZED", 12, 105, 2131623971);
      ADDRESS_BOOK_NOT_FOUND = new VineKnownErrors("ADDRESS_BOOK_NOT_FOUND", 13, 106, 2131623938);
      FACEBOOK_FF_DISABLED = new VineKnownErrors("FACEBOOK_FF_DISABLED", 14, 107, 2131623950);
      REQUIRES_ADMIN_LOGIN = new VineKnownErrors("REQUIRES_ADMIN_LOGIN", 15, 150, 2131623967);
      ACCOUNT_DEACTIVATED = new VineKnownErrors("ACCOUNT_DEACTIVATED", 16, 187, 2131623937);
      USERNAME_IN_USE = new VineKnownErrors("USERNAME_IN_USE", 17, 200, 2131623977);
      USERNAME_INVALID_CHARACTERS = new VineKnownErrors("USERNAME_INVALID_CHARACTERS", 18, 201, 2131623975);
      USERNAME_INVALID_LENGTH = new VineKnownErrors("USERNAME_INVALID_LENGTH", 19, 202, 2131623976);
      ORPHANED_USER_ACCOUNT = new VineKnownErrors("ORPHANED_USER_ACCOUNT", 20, 203, 2131623961);
      DESCRIPTION_INVALID_LENGTH = new VineKnownErrors("DESCRIPTION_INVALID_LENGTH", 21, 205, 2131623945);
      TOO_MANY_MENTIONS = new VineKnownErrors("TOO_MANY_MENTIONS", 22, 206, 2131623969);
      DUPLICATE_MENTIONS = new VineKnownErrors("DUPLICATE_MENTIONS", 23, 207, 2131623946);
      USER_DESCRIPTION_INVALID_LENGTH = new VineKnownErrors("USER_DESCRIPTION_INVALID_LENGTH", 24, 208, 2131623978);
      PASSWORD_INVALID = new VineKnownErrors("PASSWORD_INVALID", 25, 210, 2131623962);
      PHONE_INVALID = new VineKnownErrors("PHONE_INVALID", 26, 211, 2131623964);
      LOCATION_INVALID_LENGTH = new VineKnownErrors("LOCATION_INVALID_LENGTH", 27, 212, 2131623956);
      EMAIL_IN_USE = new VineKnownErrors("EMAIL_IN_USE", 28, 220, 2131623948);
      EMAIL_INVALID = new VineKnownErrors("EMAIL_INVALID", 29, 221, 2131623947);
      TWITTER_NAME_IN_USE = new VineKnownErrors("TWITTER_NAME_IN_USE", 30, 222, 2131623970);
      TWITTER_WRONG_ACCOUNT = new VineKnownErrors("TWITTER_WRONG_ACCOUNT", 31, 223, 2131623972);
      PASSWORD_RESET_TOKEN_EXPIRED = new VineKnownErrors("PASSWORD_RESET_TOKEN_EXPIRED", 32, 225, 2131623963);
      CANT_FOLLOW_SELF = new VineKnownErrors("CANT_FOLLOW_SELF", 33, 250, 2131623942);
      CANT_FLAG_SELF = new VineKnownErrors("CANT_FLAG_SELF", 34, 251, 2131623941);
      FSQUARE_VENUE_INVALID = new VineKnownErrors("FSQUARE_VENUE_INVALID", 35, 301, 2131623952);
      VIDEOURL_INVALID = new VineKnownErrors("VIDEOURL_INVALID", 36, 302, 2131623979);
      COMMENT_INVALID_LENGTH = new VineKnownErrors("COMMENT_INVALID_LENGTH", 37, 303, 2131623944);
      AVATAR_INVALID = new VineKnownErrors("AVATAR_INVALID", 38, 304, 2131623939);
      RELATIONSHIP_REQUIRES_ACTION = new VineKnownErrors("RELATIONSHIP_REQUIRES_ACTION", 39, 400, 2131623966);
      CAPTCHA = new VineKnownErrors("CAPTCHA", 40, 419, 2131623943);
      NOTIFICATION_REFERENCES_SELF = new VineKnownErrors("NOTIFICATION_REFERENCES_SELF", 41, 500, 2131623959);
      RECORD_DOES_NOT_EXIST = new VineKnownErrors("RECORD_DOES_NOT_EXIST", 42, 900, 2131623965);
      NO_ARGUMENTS_PROVIDED = new VineKnownErrors("NO_ARGUMENTS_PROVIDED", 43, 901, 2131623960);
      VineKnownErrors[] arrayOfVineKnownErrors = new VineKnownErrors[44];
      arrayOfVineKnownErrors[0] = INVALID_ERROR_CODE;
      arrayOfVineKnownErrors[1] = UNKNOWN_ERROR;
      arrayOfVineKnownErrors[2] = UNSUPPORTED_METHOD;
      arrayOfVineKnownErrors[3] = MISSING_REQUIRED_FIELD;
      arrayOfVineKnownErrors[4] = ACCESS_DENIED;
      arrayOfVineKnownErrors[5] = INVALID_ARGUMENT;
      arrayOfVineKnownErrors[6] = NON_INTEGER_VALUE;
      arrayOfVineKnownErrors[7] = REQUIRES_LOGIN;
      arrayOfVineKnownErrors[8] = BAD_CREDENTIALS;
      arrayOfVineKnownErrors[9] = EXPIRED_SESSION;
      arrayOfVineKnownErrors[10] = INVALID_SESSION;
      arrayOfVineKnownErrors[11] = FACEBOOK_NOT_AUTHORIZED;
      arrayOfVineKnownErrors[12] = TWITTER_NOT_AUTHORIZED;
      arrayOfVineKnownErrors[13] = ADDRESS_BOOK_NOT_FOUND;
      arrayOfVineKnownErrors[14] = FACEBOOK_FF_DISABLED;
      arrayOfVineKnownErrors[15] = REQUIRES_ADMIN_LOGIN;
      arrayOfVineKnownErrors[16] = ACCOUNT_DEACTIVATED;
      arrayOfVineKnownErrors[17] = USERNAME_IN_USE;
      arrayOfVineKnownErrors[18] = USERNAME_INVALID_CHARACTERS;
      arrayOfVineKnownErrors[19] = USERNAME_INVALID_LENGTH;
      arrayOfVineKnownErrors[20] = ORPHANED_USER_ACCOUNT;
      arrayOfVineKnownErrors[21] = DESCRIPTION_INVALID_LENGTH;
      arrayOfVineKnownErrors[22] = TOO_MANY_MENTIONS;
      arrayOfVineKnownErrors[23] = DUPLICATE_MENTIONS;
      arrayOfVineKnownErrors[24] = USER_DESCRIPTION_INVALID_LENGTH;
      arrayOfVineKnownErrors[25] = PASSWORD_INVALID;
      arrayOfVineKnownErrors[26] = PHONE_INVALID;
      arrayOfVineKnownErrors[27] = LOCATION_INVALID_LENGTH;
      arrayOfVineKnownErrors[28] = EMAIL_IN_USE;
      arrayOfVineKnownErrors[29] = EMAIL_INVALID;
      arrayOfVineKnownErrors[30] = TWITTER_NAME_IN_USE;
      arrayOfVineKnownErrors[31] = TWITTER_WRONG_ACCOUNT;
      arrayOfVineKnownErrors[32] = PASSWORD_RESET_TOKEN_EXPIRED;
      arrayOfVineKnownErrors[33] = CANT_FOLLOW_SELF;
      arrayOfVineKnownErrors[34] = CANT_FLAG_SELF;
      arrayOfVineKnownErrors[35] = FSQUARE_VENUE_INVALID;
      arrayOfVineKnownErrors[36] = VIDEOURL_INVALID;
      arrayOfVineKnownErrors[37] = COMMENT_INVALID_LENGTH;
      arrayOfVineKnownErrors[38] = AVATAR_INVALID;
      arrayOfVineKnownErrors[39] = RELATIONSHIP_REQUIRES_ACTION;
      arrayOfVineKnownErrors[40] = CAPTCHA;
      arrayOfVineKnownErrors[41] = NOTIFICATION_REFERENCES_SELF;
      arrayOfVineKnownErrors[42] = RECORD_DOES_NOT_EXIST;
      arrayOfVineKnownErrors[43] = NO_ARGUMENTS_PROVIDED;
    }

    private VineKnownErrors(int paramInt1, int paramInt2)
    {
      this.code = paramInt1;
      this.message = paramInt2;
    }

    public static VineKnownErrors valueOf(int paramInt)
    {
      switch (paramInt)
      {
      default:
        return INVALID_ERROR_CODE;
      case 0:
        return UNKNOWN_ERROR;
      case 1:
        return UNSUPPORTED_METHOD;
      case 3:
        return MISSING_REQUIRED_FIELD;
      case 4:
        return ACCESS_DENIED;
      case 5:
        return INVALID_ARGUMENT;
      case 6:
        return NON_INTEGER_VALUE;
      case 100:
        return REQUIRES_LOGIN;
      case 101:
        return BAD_CREDENTIALS;
      case 102:
        return EXPIRED_SESSION;
      case 103:
        return INVALID_SESSION;
      case 104:
        return FACEBOOK_NOT_AUTHORIZED;
      case 105:
        return TWITTER_NOT_AUTHORIZED;
      case 106:
        return ADDRESS_BOOK_NOT_FOUND;
      case 107:
        return FACEBOOK_FF_DISABLED;
      case 150:
        return REQUIRES_ADMIN_LOGIN;
      case 200:
        return USERNAME_IN_USE;
      case 201:
        return USERNAME_INVALID_CHARACTERS;
      case 202:
        return USERNAME_INVALID_LENGTH;
      case 203:
        return ORPHANED_USER_ACCOUNT;
      case 205:
        return DESCRIPTION_INVALID_LENGTH;
      case 206:
        return TOO_MANY_MENTIONS;
      case 207:
        return DUPLICATE_MENTIONS;
      case 208:
        return USER_DESCRIPTION_INVALID_LENGTH;
      case 210:
        return PASSWORD_INVALID;
      case 211:
        return PHONE_INVALID;
      case 212:
        return LOCATION_INVALID_LENGTH;
      case 220:
        return EMAIL_IN_USE;
      case 221:
        return EMAIL_INVALID;
      case 222:
        return TWITTER_NAME_IN_USE;
      case 223:
        return TWITTER_WRONG_ACCOUNT;
      case 225:
        return PASSWORD_RESET_TOKEN_EXPIRED;
      case 250:
        return CANT_FOLLOW_SELF;
      case 251:
        return CANT_FLAG_SELF;
      case 301:
        return FSQUARE_VENUE_INVALID;
      case 302:
        return VIDEOURL_INVALID;
      case 303:
        return COMMENT_INVALID_LENGTH;
      case 304:
        return AVATAR_INVALID;
      case 400:
        return RELATIONSHIP_REQUIRES_ACTION;
      case 419:
        return CAPTCHA;
      case 500:
        return NOTIFICATION_REFERENCES_SELF;
      case 900:
        return RECORD_DOES_NOT_EXIST;
      case 901:
      }
      return NO_ARGUMENTS_PROVIDED;
    }

    public static VineKnownErrors valueOf(VineError paramVineError)
    {
      return valueOf(paramVineError.errorCode);
    }

    public String getMessage(Context paramContext)
    {
      return paramContext.getString(this.message);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineError
 * JD-Core Version:    0.6.2
 */