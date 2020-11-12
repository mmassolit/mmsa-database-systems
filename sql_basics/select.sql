SELECT p.first_name, 
       p.last_name,
       COUNT(DISTINCT o.id) total_orders,
       SUM(oi.quantity) total_items_bought,
       SUM((oi.quantity * i.price) - oi.discount) total_money_spent
       
FROM ka8621.person p
LEFT JOIN ka8621.order o ON p.id = o.person_id
LEFT JOIN ka8621.order_item oi ON o.id = oi.order_id
LEFT JOIN ka8621.item i ON i.id = oi.item_id

GROUP BY p.id
ORDER BY p.id
