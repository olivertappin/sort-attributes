# sort-attributes package

Sorts selected HTML attributes in alphabetical order.

## Usage

Highlight the HTML you would like to sort and choose 'Sort Attributes: Convert'
from the Command Palette. Alternatively, use the keyboard shortcut `F5`.

![Screenshot video example](https://cloud.githubusercontent.com/assets/9773040/13718309/b4ce728c-e7e0-11e5-867f-3d2866b09669.gif)

# Support

Currently, this package only supports full HTML selections. If you select an incomplete HTML selection, such as `<a href="#">`, end tags will be added for you. Certain characters within the HTML attribute values will also be encoded with HTML entities (such as PHP opening tags). Support for decoding of these values are planned to be released in future versions.

# Examples

Please see the following examples where this package will easily sort HTML
attributes in alphabetical order:

```<a href="#" class="anchor">Click me</a>```
```<input type="email" class="form__input" placeholder="Email address">```
```<nav id="nav" class="nav">
    <ul>
        <li><a href="#">Link 1</a></li>
        <li><a href="#">Link 2</a></li>
        <li><a href="#">Link 3</a></li>
    </ul>
</nav>
```
