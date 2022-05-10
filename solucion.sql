SELECT SUM (tb.precio_venta*d.cantidad)
FROM (
    SELECT fecha_precio_venta, id_producto, precio_venta
    FROM precio_venta
    WHERE fecha_precio_venta = (
        SELECT MAX(fecha_precio_venta)
        FROM precio_venta
    )
    GROUP BY id_producto
) AS tb
INNER JOIN detalle_venta AS d ON tb.id_producto = d.id_producto
INNER JOIN medio_pago AS m ON d.id_medio_pago = m.id
WHERE m.tipo_pago IN ('debito','credito');
