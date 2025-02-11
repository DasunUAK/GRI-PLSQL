select t.identity,t.description,fnd_user_property_API.get_value(t.IDENTITY,'SMTP_MAIL_ADDRESS')  from IFSAPP.FND_USER t
where t.active = 'TRUE'
