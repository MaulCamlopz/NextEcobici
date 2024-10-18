# NextEcobici

**Prueba técnica - iOS Mobile**

*Descripción*

Desarrollar una aplicación nativa en SwiftUI que permita iniciar sesión y muestre un listado de las Ecobicis y su detalle.

**Requisitos**

- La aplicación debe contar con una vista que permita el inicio de sesión utilizando Firebase.
- ⁠La aplicación debe mostrar un listado con las primeras 50 estaciones de Ecobici.
- ⁠Cada celda del listado debe mostrar el nombre de la estación y bicicletas disponibles.
- ⁠Al seleccionar una estación, la aplicación debe mostrar la ubicación de la estación en un mapa (MapKit) con un marcador resaltado.
- ⁠La aplicación debe mostrar los siguientes datos para cada estación:
    - Lugares vacíos
    - Bicicletas libres
    - Nombre
    - Total de lugares

**Recursos**

- Listado de Ecobicis: https://api.citybik.es/v2/networks/ecobici

**Instrucciones**

1.⁠ ⁠Crear una nueva aplicación en SwiftUI.
2.⁠ ⁠Implementar la vista de inicio de sesión utilizando Firebase.
3.⁠ ⁠Consumir el API de Ecobicis para obtener el listado de estaciones.
4.⁠ ⁠Mostrar el listado de estaciones con nombre y bicicletas disponibles.
5.⁠ ⁠Implementar la vista de detalles para cada estación, incluyendo mapa y datos adicionales.

**Diseño**

- ⁠La aplicación debe seguir las guías de diseño de Apple iOS: https://developer.apple.com/design/human-interface-
guidelines/lists-and-tables

**Imagen de referencia**

![Captura de pantalla 2024-10-18 a la(s) 9 07 26 a m](https://github.com/user-attachments/assets/2814ce38-72f6-46d3-b566-407da68d1ec1)

**Evaluación**

La aplicación será evaluada según los siguientes criterios:

- Lenguaje de programación: Uso correcto de SwiftUI y Swift.
- ⁠Consumo de servicio nativo: Integración efectiva de servicios nativos de iOS (MapKit, Firebase, etc.).
- ⁠Patrones de diseño: Implementación de patrones de diseño modernos (MVVM, MVC, MVP, etc.) para una arquitectura limpia y escalable.
- ⁠Mejores prácticas: Aplicación de mejores prácticas de desarrollo móvil, incluyendo manejo de errores, optimización de rendimiento y seguridad.
- ⁠Uso de manejador de dependencias: Integración efectiva de un manejador de dependencias (como Swift Package Manager o CocoaPods) para gestionar librerías y dependencias.
