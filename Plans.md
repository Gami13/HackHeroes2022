# OBYWATEL++

# Table of Content

- [OBYWATEL++](#obywatel)
- [Table of Content](#table-of-content)
- [Założenia projektu](#założenia-projektu)
  - [obywatel może:](#obywatel-może)
  - [Osoba z dostępem samorządowym może:](#osoba-z-dostępem-samorządowym-może)
- [To Do](#to-do)
  - [Komponenty](#komponenty)
    - [Główne](#główne)
    - [Złożone](#złożone)
  - [Strony](#strony)
  - [Funkcjonalność](#funkcjonalność)
  - [Strona główna](#strona-główna)
  - [Spotkania](#spotkania)
  - [Petycje](#petycje)
  - [Ogłoszenia](#ogłoszenia)
  - [Przypominajka](#przypominajka)

# Założenia projektu

## obywatel może:

- tworzyć przypomnienia o podatkach do zapłacenia
- zgłaszać problemy, petycje, pomysły do samorządu (miasta, gminy, powiatu, województwa)
- umówienie się na spotkanie z radnym (wizyta w gabinecie lub rozmowa przez telefon)
- ~~uczestniczyć i przeglądać zbiórki charytatywne w jego okolicy~~
- wystawiać lokalne ogłoszenia (zgubione/znalezione przedmioty/zbiórki charytatywne)
- ~~lista lokalnych biznesów~~

## Osoba z dostępem samorządowym może:

- akceptować spotkania/rozmowy z obywatelami
- organizować zbiórki, a także je weryfikować i nimi zarządzać
- rozpatrywać problemy, petycje, pomysły zgłaszane przez obywateli

# To Do

- Rozdzielić Forma na komponenty
- Naprawić <span style="color:Red;">🚨**WSZYSTKO**🚨</span>

## Komponenty

### Główne

- Box
- Input Text
- Input Password
- Button
- Button Secondary
- NavBar
- Popup
- Notification
- CheckBox

### Złożone

- Form Input
- Form

## Strony

- Login Form
- Register Form
- Strona główna
- Ustawianie przypominajki
- Petycje
- Ogłoszenia
- Spotkania

## Funkcjonalność

- [Obrona przed promieniami z komsmosu 👽](https://www.history.com/shows/ancient-aliens)
- [Wysyłanie powiadomień](#przypominajka)
- Wysyłanie maili
- [Wystawianie ogłoszeń](#ogłoszenia)
- [Zgłaszanie pomysłów do samorządów](#petycje)

## Strona główna

Na stronie głównej po środku powinne być wyświetlane ogłoszenia, najpierw te, które przypiął użytkownik lub samorząd. Po prawo powinien być wyświetlany kalendarz z przypominajkami.

## Spotkania

Obywatele będą mogli umawiać się na spotkania z radnymi. Spotkania będą miały 2 rodzaje:

- wizyta w gabinecie
- rozmowa telefoniczna

Radny będzie mógł akceptować spotkania, a także je odrzucać z podaniem powodu. Obywatelowi ma przyjść powiadomienie o spotkaniu.

## Petycje

Obywatele będą mogli zgłaszać petycje, pomysł lub problemyy do samorządu jako alternatywa spotkania się z radnym.

## Ogłoszenia

Każdy obywatel będzie mógł wystawić ogłoszenie, które będzie widoczne dla wszystkich obywateli w okolicy. Będą mogły one dotyczyć zaginionych rzeczy, małych prac lub w przypadku osób z dostępem samorządowym, ogłoszeń dotyczących zbiorek charytatywnych.

Przypinanie ogłoszeń przez samorządowców, a także użytkowników, którym będą się one wyświetlać na swojej stronie głównej.

## Przypominajka

Umożliwia ustawienie daty przypominania o zapłaceniu podatku. Przypominajka powinna być wysyłana na maila i powiadomienia na telefon. Można będzie wybrać ją z kilku przykładowych przypominajek, lub stworzyć własną.
