# Cssdoc
CSS styleguide generator

## Installation
```
git clone git@github.com:r7kamura/cssdoc.git
cd cssdoc
rake install
```

## Usage
Write a document as comment for your css(scss, sass) in Github Flavored Markdown.

```css
/*
  # .button
  basic button design

　```
  <button class="button">
    button
  </button>

  <button class="button danger">
    danger
  </button>
　```
*/
.button {
  ...
}
```

Launch cssdoc and open [http://localhost:4567](http://localhost:4567)

```
cssdoc
```

![](http://dl.dropbox.com/u/5978869/image/20121216_210857.png)
