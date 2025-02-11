select t.identity,t.description,q.person_id,q.title,q.initials,q.first_name,q.middle_name,q.last_name,r.last_login from 
FND_USER t
INNER JOIN PERSON_INFO_ALL q On t.identity = q.user_id
INNER JOIN (select a.identity,
       a.description,
       a.active,
       ifsapp.fnd_user_api.get_last_activity(a.identity) last_login
  from ifsapp.fnd_user a) r ON t.identity = r.identity

WHERE t.active = 'TRUE'
