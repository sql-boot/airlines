select a.airport_code as code
     , a.airport_name
     , a.city
     , a.coordinates
     , a.timezone
  from bookings.airports a
 where a.city in (select aa.city
                    from bookings.airports aa
                   group by aa.city
                  having count(*) > 1)
 order by
       a.city
     , a.airport_code
