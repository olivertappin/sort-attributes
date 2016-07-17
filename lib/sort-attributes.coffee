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
      parser = new DOMParser()
      doc = parser.parseFromString(html, 'text/html')

      tag = doc.firstChild.lastChild.firstChild

      # Check if the tag exists
      if tag?

          attributes = tag.attributes
          storedAttributes = []
          storedAttributeNames = []

          # Check if the attributes exist
          if attributes?

              # Store the attributes
              for attribute in attributes
                storedAttributeNames.push attribute.name
                storedAttributes[attribute.name] = attribute.value

              # Remove attributes from DOM
              for storedAttributeName in storedAttributeNames
                tag.removeAttribute(storedAttributeName)

              # Sort the stored attributes
              storedAttributeNames.sort()

              # Add sorted attributes back into DOM
              for storedAttributeName in storedAttributeNames
                storedAttributeValue = storedAttributes["#{storedAttributeName}"]
                tag.setAttribute(storedAttributeName, storedAttributeValue)

              editor.insertText(doc.firstChild.lastChild.innerHTML)
