# Attempt of doing a well looking Pokedex with flutter

Made using:

- **Riverpod** as state manager
- **GoRouter** for navigation
- **Freezed** to define models with ease
- **PokeApi** for requests

## Requisitos

### Objetivo

Tenemos reportes de entrenadores que usan teléfonos Android, Apple y ordenadores. Por lo que
necesitamos que la Pokédex pueda ejecutarse en sistemas operativos **Android e iOS**. Para personas como yo
que seguimos con nuestro Nokia 3310, podremos acceder a la Pokédex como **aplicación de escritorio** o **web**.

### Descripción general:

La Pokédex deberá tener las siguientes secciones:

- **Pokédex**: Lista de todos los Pokémon disponibles.
- **Capturados**: Lista de los Pokémon capturados por el entrenador.
- **Pokémon en detalle**: Cuando se hace click en un Pokémon tanto de la Pokédex como de los Capturados,
  debería abrirse una nueva pantalla donde se verán más detalles sobre el Pokémon seleccionado.

**El menú puede ser de cualquier tipo** y dejamos a tu elección la decisión de cuál es el más adecuado
para nuestro caso de uso.

Los datos serán obtenidos de la API pública de Pokémon llamada **PokéApi**, [aquí tienes su documentación](https://pokeapi.co/docs/v2).

Ahora vamos a explicar más en profundidad qué queremos para cada pantalla...

### Pokédex

En esta sección, queremos que el entrenador pueda ver todos los Pokémon disponibles en su región. Esta
primera versión de la Pokédex va a ser probada en la región de Kanto, esto quiere decir que **solo
queremos mostrar los primeros 151 Pokémon**.

También queremos dar al entrenador la oportunidad de buscar los Pokémon por nombre, por lo que **integraremos un buscador
que filtrará la lista de Pokémon a los que se ajusten con el texto de la búsqueda**.

Por supuesto, como hemos comentado antes, **al hacer click en un Pokémon de la lista, se abre otra pantalla con los detalles de dicho Pokémon**.

### Capturados

En este apartado, queremos ver los Pokémon capturados por el entrenador. Al final, la Pokédex sirve para eso ¿no?

La lista de Pokémon capturados debe aparecer **ordenada por su id**. Aunque daremos al entrenador la
posibilidad de **filtrar los Pokémon por tipo** y a **ordenarlos alfabéticamente**.

Al igual que en la pantalla de Pokédex, **al hacer clic en un Pokémon de la lista, se verán los detalles del Pokémon en otra pantalla**.

### Vista en detalle del Pokémon

Esta pantalla mostrará la información del Pokémon seleccionado. El diseño es de tu elección, pero necesitamos
**enseñar todos estos datos**:

- Id.
- Nombre.
- Foto.
- Altura y peso (en la unidad que devuelve la API, no es necesario hacer conversiones a centímetros o kilogramos).
- Tipos del Pokémon.

Además de todos esos datos, deberemos poder **añadir o quitar el Pokémon como capturado**. Los Pokémon capturados
deben de ser almacenados localmente en el teléfono. La manera en la que almacenes los datos es de tu elección.

Por supuesto, **cuando se navegue hacia atrás, debemos volver a la misma pantalla que estábamos**.

### UI - Interfaz de Usuario

Queremos que la Pokédex sea personalizable. Por ello vamos a personalizar los colores dependiendo de varios factores.

Por defecto, **la paleta de colores usada en la aplicación y la Top Bar** va a ser del color original de la Pokédex, que
es el color "Red" o "Boston University Red" (el que más te guste). Puedes encontrar sus códigos de color
[en este enlace](https://www.schemecolor.com/pokemon-colors.php).

Para hacerlo aún más personalizable, **la paleta de colores cambiará dependiendo del tipo de los Pokémon capturados**.

Por ejemplo:

- Si el entrenador tiene capturados 3 Pokémon de tipo Agua, y 2 de Planta, la paleta de colores será basada
  en el color asociado al tipo Agua.
- En el caso de que el entrenador no tenga Pokémon capturados o no haya un tipo mayoritario entre los Pokémon
  capturados (por ejemplo si el entrenador tiene capturados 2 Pokémon de tipo Planta y 2 de tipo Agua), la paleta
  de colores será la paleta por defecto mencionada anteriormente.

Los tipos de los Pokémon pueden obtenerse de la propia API y sus colores asociados pueden consultarse en
[este link](https://www.pokemonaaah.net/artsyfartsy/colordex/).

### Extra

- Los pasos anteriores son los requisitos mínimos, pero todas las mejoras añadidas en la experiencia de
  usuario (UX) o la interfaz gráfica (UI) son de agradecer.
- Se valorarán buenas prácticas, clean architecture y el uso de cualquier librería de control
  de calidad del código.

# Showcase:
![Showcase Phone App](./showcaseImages/showcase_phone_app.gif)

# Problems:
- The AppBar is too big in Desktop mode
- ScrollDown to get next page doesn't trigger always (could be done better)
- HomePage is a mess could be refactored

