class UI
  decodeEmails: ->
    elements = document.getElementsByClassName("email")

    for el in elements
      if href = el.getAttribute("href")
        el.setAttribute("href", @decoder(href))

      el.textContent = @decoder(el.textContent)

      null

  decoder: (string)->
    string.replace(/\*at\*/g, '@')

ui = new UI()
ui.decodeEmails()
