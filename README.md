# Cssdoc
CSS styleguide generator

## Installation
```
gem install cssdoc
```

## Usage
Write a document as comment for your css(scss, sass) in Github Flavored Markdown.

```
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

and launch cssdoc

```
cssdoc
```

and then, open [http://localhost:4567](http://localhost:4567)

![](http://dl.dropbox.com/u/5978869/image/20121216_210857.png)
