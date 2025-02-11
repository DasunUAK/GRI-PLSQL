select a.identity,
       a.description,
       a.active,
       ifsapp.fnd_user_api.get_last_activity(a.identity) last_login
  from ifsapp.fnd_user a

IF({INSTANT_INVOICE_REP.CURRENCY_CODE}= 'USD') THEN '$'
Else IF ({INSTANT_INVOICE_REP.CURRENCY_CODE}= 'EUR') THEN '€'
Else IF ({INSTANT_INVOICE_REP.CURRENCY_CODE}= 'GBP') THEN '£'
Else 'LKR'


