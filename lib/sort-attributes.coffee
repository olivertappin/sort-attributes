{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'sort-attributes:convert': => @convert()

  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    if editor = atom.workspace.getActiveTextEditor()
      html = editor.getSelectedText()

      if html
        typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'
        htmlTag = html.split('>')

        if typeIsArray htmlTag
          [attributes] = htmlTag.splice(0, 1)
          tagBeginning = attributes

          attributes = attributes.split(' ').splice(1).sort()
          [tagBeginning] = tagBeginning.split(' ').splice(0, 1)

          [tagContent] = htmlTag
          attributeLength = attributes.length

          if attributeLength is 0
            returnText = tagBeginning + '>'

          else
            returnText = tagBeginning + ' ' + attributes.join(' ') + '>'

            if tagContent
              returnText += tagContent + '>'

          editor.insertText(returnText)

        else
          console.log('Selected string does not match the required selection for sorting')

      else
        console.error('Text not selected for sorting')
