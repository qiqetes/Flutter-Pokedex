# Attempt of doing a well looking Pokedex with flutter
Made using:
It was a weekend project so the code is not perfect. Following sort of MVC architecture (also pushed a branch with the MVVM architecture). 

- **Riverpod** as state manager
- **GoRouter** for navigation
- **Freezed** to define models with ease
- **PokeApi** for requests using GraphQL

**Interesting bits:** It can cache the api searches, so the same search won't trigger a new request; Infinite Scrolling; Responsive design;


# Showcase:
![Showcase Phone App](./showcaseImages/showcase_phone_app.gif)


## Requirements (By the interviewer company)

### Goal

We have reports from trainers using Android phones, Apple devices, and computers. Therefore,
we need the Pokédex to run on **Android and iOS** operating systems. For people like me
who still use our Nokia 3310, we can access the Pokédex as a **desktop application** or **web app**.

### Overview:

The Pokédex should have the following sections:

- **Pokédex**: List of all available Pokémon.
- **Caught**: List of Pokémon caught by the trainer.
- **Pokémon Details**: When clicking on a Pokémon from either the Pokédex or Caught sections,
  a new screen should open showing more details about the selected Pokémon.

**The menu can be of any type** and we leave it to your choice to decide which is most appropriate
for our use case.

Data will be obtained from the public Pokémon API called **PokéAPI**, [see its documentation here](https://pokeapi.co/docs/v2).

Now let's explain in more detail what we want for each screen...

### Pokédex

In this section, we want the trainer to see all available Pokémon in their region. This
first version of the Pokédex will be tested in the Kanto region, which means we **only
want to show the first 151 Pokémon**.

We also want to give the trainer the opportunity to search for Pokémon by name, so **we'll integrate a search bar
that filters the Pokémon list to those matching the search text**.

Of course, as mentioned before, **clicking on a Pokémon in the list opens another screen with that Pokémon's details**.

### Caught

In this section, we want to see the Pokémon caught by the trainer. After all, that's what the Pokédex is for, right?

The list of caught Pokémon must appear **ordered by their id**. However, we'll give the trainer the
ability to **filter Pokémon by type** and **sort them alphabetically**.

Just like on the Pokédex screen, **clicking on a Pokémon in the list shows the Pokémon's details on another screen**.

### Pokémon Detail View

This screen will display information about the selected Pokémon. The design is your choice, but we need to
**show all this data**:

- Id.
- Name.
- Image.
- Height and weight (in the unit returned by the API, no need to convert to centimeters or kilograms).
- Pokémon types.

In addition to all that data, we must be able to **add or remove the Pokémon as caught**. Caught Pokémon
must be stored locally on the device. How you store the data is your choice.

Of course, **when navigating back, we must return to the same screen we were on**.

### UI - User Interface

We want the Pokédex to be customizable. That's why we'll customize the colors depending on several factors.

By default, **the color palette used in the application and the Top Bar** will be the original Pokédex color,
which is "Red" or "Boston University Red" (whichever you prefer). You can find its color codes
[in this link](https://www.schemecolor.com/pokemon-colors.php).

To make it even more customizable, **the color palette will change depending on the type of caught Pokémon**.

For example:

- If the trainer has 3 caught Water-type Pokémon and 2 Grass-type, the color palette will be based
  on the color associated with the Water type.
- In case the trainer has no caught Pokémon or there's no dominant type among caught Pokémon
  (for example, if the trainer has 2 caught Grass-type and 2 Water-type), the color palette
  will be the default palette mentioned earlier.

Pokémon types can be obtained from the API itself and their associated colors can be found at
[this link](https://www.pokemonaaah.net/artsyfartsy/colordex/).

### Extra

- The steps above are the minimum requirements, but any improvements made to user experience (UX)
  or user interface (UI) are appreciated.
- Good practices, clean architecture, and the use of any code quality control library will be valued.
