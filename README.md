# contpaqi_technical_test 

Aplicación Flutter que integra múltiples capacidades modernas, incluyendo autenticación OAuth2.0, biometría, mapas con rendimiento optimizado, internacionalización, pruebas y Clean Architecture. 

---

## Arquitectura Utilizada

Se implementó **Clean Architecture**, estructurada en tres capas principales:

- **Presentation**: Manejo de UI y lógica de presentación con BLoC.
- **Domain**: Entidades, casos de uso y lógica pura del negocio.
- **Data**: Implementación de fuentes de datos (API) y modelos de request/response.

Además, la arquitectura está modularizada por **features** (`auth`, `movies`, `map`, etc.) y se apoya en una capa **core** que centraliza recursos reutilizables como mapeadores, helpers, constantes, y servicios comunes.

---

## Paquetes principales

| Paquete                | Propósito                                       |
|------------------------|-------------------------------------------------|
| `flutter_bloc`         | Gestión de estado y lógica por pantalla.       |
| `http`                 | Consumo eficiente de API REST.                 |
| `flutter_appauth`      | Autenticación OAuth 2.0 con Asgardeo.          |
| `flutter_secure_storage` | Almacenamiento seguro de tokens.             |
| `local_auth`           | Login biométrico tras la primera autenticación.|
| `google_maps_flutter`  | Visualización de mapas y markers dinámicos.    |
| `flutter_localizations` + `.arb` | Soporte para español e inglés.      |

---

## Decisiones Técnicas Clave

- **Patrón BLoC** fue elegido por su escalabilidad, claridad en flujos y buen soporte en pruebas.
- **Almacenamiento seguro** de tokens (`access` y `refresh`) en `flutter_secure_storage` para proteger datos sensibles.
- **Login inicial con OAuth2.0**, y autenticación posterior con biometría para mejorar experiencia de usuario.
- **Cluster y Lazy Loading** para markers en Google Maps, evitando caída de rendimiento con miles de elementos.
- **Internacionalización** siguiendo convención `componenteSubcomponente` (`authButtonLabel`, `movieDetailTitle`, etc.) para facilitar consistencia y traducciones.
- **Pruebas unitarias** centradas en lógica de negocio como generación eficiente de markers y validación de manejo de errores HTTP.
- **CI/CD** implementado mediante `flutter.yml` en GitHub Actions: se genera automáticamente un `.apk` en la rama `main`.

---

## Funcionalidades Destacadas

- Autenticación segura mediante OAuth2.0 con Asgardeo.
- Login biométrico tras la autenticación inicial.
- Soporte bilingüe (Español e Inglés) con archivos `.arb`.
- Google Maps con enfoque en rendimiento: markers dinámicos, lazy loading y clustering.
- Pantalla de películas actuales en cartelera, con imágenes y metadatos en múltiples idiomas.
- Pruebas unitarias del dominio y manejo de estados.
- Automatización de builds en GitHub Actions.

---

## Automatización

Se incluye archivo `flutter.yml` para GitHub Actions, el cual:

- Se activa en cada push a la rama `main`.
- Ejecuta pruebas.
- Genera el `.apk` automáticamente.

---


