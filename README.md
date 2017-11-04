# catdtWiki
codes to solve common problems

select count(messages_table.fromaddress) as c1,count(messages_table.toaddress) as c2, messages_table.fromaddress as f, messages_table.toaddress as t from prep.messages_table where messages_table.toaddress not like '%@enron.com%' and messages_table.fromaddress like '%enron.com%' group by f,t having count(messages_table.fromaddress)  > 2 and count(messages_table.toaddress) >2 order by count(*) desc limit 20
