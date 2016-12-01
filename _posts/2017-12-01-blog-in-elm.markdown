---
layout: post
title: Blog en elm
date: 2017-12-31 15:00
comments: true
external-url: /blog-en-elm
categories: Elm
---

Depuis quelques mois, je prends beaucoup de plaisir à apprendre Elm.

```elm
module Main exposing (..)

import Html as App exposing (program)

type alias Model = {
  posts: List Post
}

type alias Post = {
  author: String
  published_at: Time
  title: String
  article: String
}

type Msg =
  NewPost

initModel : Model
initModel = {
  posts = []
}

update : Model -> Msg -> Model -> Cmd Msg
update model msg =
  case msg of
    NewPost post ->
      ( { model | posts = post :: model.posts }, Cmd.none )

view : Model -> Html Msg
  div [] [
    h1 [] [ text "My Elm Blog"]
    , viewPosts model.post
  ]

viewPosts : List Posts
viewPosts posts =
  div [] [
    List.map viewPost posts
  ]

viewPost : Post
viewPost post =
  div [] [
    p [] [ text post.author ]
    , article [] [ text post.article ]
  ]

main : Program Never Model Msg
main = App.beginnerProgram {
  model = initModel
  update = update
  view = view
}


```
