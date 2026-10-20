BEGIN;

INSERT INTO categorias (nombre, slug) VALUES
    ('ensalada', 'ensalada'),
    ('pasta', 'pasta'),
    ('pizza', 'pizza'),
    ('postre', 'postre')
ON CONFLICT (nombre) DO NOTHING;

INSERT INTO productos (nombre, descripcion, precio_cop, imagen, categoria_id)
SELECT datos.nombre, datos.descripcion, datos.precio_cop, datos.imagen, categorias.id
FROM (VALUES
    ('Insalata Caprese', 'tomate,mozzarella fresca,albahaca,aceite de oliva', 22000, 'ensalada.webp', 'ensalada'),
    ('Insalata Mista', 'mezcla de lechugas,zanahoria,cebolla morada,aceitunas', 15000, 'ensalada2.webp', 'ensalada'),
    ('Insalata di Mare', 'mariscos frescos,apio,limon,aceite de oliva', 24000, 'ensalada3.webp', 'ensalada'),
    ('pasta clasica', '.........', 34000, 'pasta1.webp', 'pasta'),
    ('pasta exclusiva', 'Quinoa, cerezas, tomate, aceitunas, cereal.', 41500, 'pasta2.webp', 'pasta'),
    ('pasta premium', 'Quinoa, cerezas, tomate, aceitunas, cereal.', 55000, 'pasta3.webp', 'pasta'),
    ('Pizza Diavola', 'Salsa de Tomate, mozzarella, pepperoni y aceitunas.', 45000, 'pizza1.webp', 'pizza'),
    ('Pizza Salame e Formaggio', 'Mozzarella, salami y oregano.', 42000, 'pizza2.webp', 'pizza'),
    ('Pizza Margherita', 'Salsa de Tomate, mozzarella y albahaca.', 38000, 'pizza3.webp', 'pizza'),
    ('Tiramisu', 'Bizcocho, cafe, mascarpone y cacao.', 35000, 'postres1.webp', 'postre'),
    ('Mousse al Cioccolato', 'Mousse de chocolate con frambuesas.', 30000, 'postres2.webp', 'postre'),
    ('Crostatine ai Frutti di bosco', 'Tartaletas con crema y frutos rojos.', 32000, 'postres3.webp', 'postre')
) AS datos(nombre, descripcion, precio_cop, imagen, categoria)
JOIN categorias ON categorias.nombre = datos.categoria
ON CONFLICT (nombre) DO NOTHING;

COMMIT;