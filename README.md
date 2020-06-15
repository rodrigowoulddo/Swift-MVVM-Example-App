# Sicredi iOS Engineer Test
![](https://badgen.net/badge/iOS/13/blue) ![](https://badgen.net/badge/Swift/5/orange)

`Versão em português abaixo.`

## Information
This is a sample app for an iOS engineer job at Sicredi - Brazil. The app features are:

* An event list
* Event details
* Event check-in with cupon option

I built it with the Model View View-Model architecture (MVVM) for it keeps the code cleaner and easier to support. I've used third-party libraries for API requests, cached image loading, and animations.

## Screenshots

<img src="Screenshots/event-list.png" alt="alt text" width="260"> <img src="Screenshots/event-detail.png" alt="alt text" width="260"> <img src="Screenshots/event-checkin.png" alt="alt text" width="260">

## Instalation

First of all, download this repo

```
git clone https://github.com/rodrigowoulddo/Teste-Dev-iOS-Woop-Sicredi
cd Teste-Dev-iOS-Woop-Sicredi
```

Then install third-party libraries

```
pod install
```

And finally, open it on XCode to launch in any device

```
xed .
```

## Extra features
* Search on the event list
* Push reload on the event list
* Smooth cell loading with animation
* Lottie animation for check-in success
* Smooth and async image loading
* Integration with Apple Maps
* Self-sizing TableViewCells

_____

## Informação
Este é um app de exemplo para a vaga de desenvolvedor iOS no Sicredi - Brasil. As funcionalidades do app são:

* Lista de eventos
* Detalhes do evento
* Checkin no evento com opção de cupom

Construí o app com a arquitetura Model View View-Model architecture (MVVM) pois mantém o código mais limpo e facilita o suporte. Usei libs de terceiros para as requisições à API, carregamento de imagens com cache, e animações.

## Instalação

Primeiro, faça o download do repositório

```
git clone https://github.com/rodrigowoulddo/Teste-Dev-iOS-Woop-Sicredi
cd Teste-Dev-iOS-Woop-Sicredi
```

Depois instale as libs de terceiros

```
pod install
```

E por fim, abra o projeto no XCode e instale em qualquer dispositivo ou simulador

```
xed .
```

## EFunconalidades extras
* Busca na lista de eventos
* Puxe para recarregar na lista de eventos
* Carregamento suave das células com animação
* Animação Lottie ao fazer checkin com sucesso
* Carregamento suave e cacheado de imagens
* Integração com Apple Maps
* TableViewCells com tamanho automático
