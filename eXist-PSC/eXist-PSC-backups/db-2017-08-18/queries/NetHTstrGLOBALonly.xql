xquery version "3.0";
xquery version "3.0";
declare default element namespace "http://www.tei-c.org/ns/1.0";
declare variable $hamilton := collection('/db/hamilton/');
declare variable $actOne := collection('/db/hamilton/Act_One');
declare variable $actTwo := collection('/db/hamilton/Act_Two');
declare variable $speakers := 
   if ($hamilton//sp[contains(@who, ' #')])
   then $hamilton//sp/@who/tokenize(normalize-space(string()), ' ')
   else $hamilton//sp/@who/normalize-space(string());
(:ebb: Some of the speakers are listed as doubled, so we need to tokenize on white space if it's present.
 : DISCUSS in context with normalize-space(), too. :)
declare variable $distinctSpks := distinct-values($speakers);
