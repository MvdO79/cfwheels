```coldfusion
model(name)
```
```coldfusion
// The `model("author")` part of the code below gets a reference to the model from the application scope, and then the `findByKey` class level method is called on it
authorObject = model("author").findByKey(1)>
```