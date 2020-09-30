@startuml

entity cliente {
+ cliente_dni (PK)
--
  cliente_nombre
  cliente_apellido
  cliente_fecha_nac
  cliente_mail
  cliente_direccion
}


entity sucursal  {
  + sucursal_nro (PK)
  --
  sucursal_direccion
  sucursal_telefono
  sucursal_mail  
  sucursal_ciudad
}
entity producto {
+ producto_id (PK)
}

entity modelo {
+ modelo_codigo (PK)
--
  modelo_nombre
  modelo_potencia
}


entity automovil {
  auto_nro_chasis
  auto_nro_motor
  auto_patente
  auto_fecha_alta
  auto_cant_kms
  tipo_motor
}
entity tipo_caja {
  + tipo_caja_codigo (PK)
--
  tipo_caja_desc
}

entity tipo_auto {
+ tipo_auto_codigo (PK)
--
  tipo_auto_desc
}

entity tipo_transmision {
  + tipo_transmision (PK)
--
  tipo_transmision_desc
}

entity autoparte {
  + auto_parte_codigo (PK)
  --
  auto_parte_descripcion
}

entity compra  {
  + compra_nro (PK)
--
  compra_fecha
  compra_precio
}

entity  compra_detalle {
  compra_cantidad
  compra_precio_unitario
}

entity fabricante {
+ id_fabricante (PK)
--
  nombre_fabricante
}


entity factura {
  + factura_nro (PK)
--
  factura_fecha
  precio_facturado
}

entity factura_detalle {
  cant_facturada
  precio_unitario
}




cliente ||--o{ factura
factura }o--|| sucursal
cliente ||--o{ compra
sucursal ||--o{ compra
compra ||--|{ compra_detalle
compra_detalle ||--|{ producto
producto }o--|| modelo
producto <--o{ automovil  
producto <--o{ autoparte  
automovil }o--|| tipo_caja
automovil }o--|| tipo_auto
automovil }o--|| tipo_transmision
producto }o--|| fabricante
factura ||--|{ factura_detalle
factura_detalle ||--|{ producto

  
@enduml