class EmailDecoder
  constructor: ->
    @$email = $('.profile .about .email')
    words = @$email.attr('data-swahili')
    emailLocalPart = @decode(words)

    @render(emailLocalPart)

  succ: (str) ->
    ary = []

    $.each str.split(''), (index, value) ->
      charCode = str.charCodeAt(index)
      char = String.fromCharCode(charCode + 1)

      ary.push(char)

    ary.join('')

  removeEdge: (str) ->
    str.substr(1, (str.length - 2))

  decode: (words) ->
    str = words.split(' ').join('')
    
    @removeEdge(@succ(str))

  render: (emailLocalPart) ->
    @$email.text(" #{emailLocalPart}@gmail.com")

$ ->
  if $('#home').length
    if $('.index').length
      new EmailDecoder()