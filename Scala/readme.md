Scala
=====

- Not really very enjoyable.
- At times, when chaining maps and filters, it feels a bit like writing Python with the added benefit that the compiler has got your back! That was cool.
- Eventually the fastidiousness of having a List vs. a Vector vs. a Sequence, in spite of promises that it has huge performance implications because of different access modes or w/e, becomes overwhelming.
- Finding information online is extremely tough. On StackOverflow, even basic questions like ["Read entire file in Scala?"](https://stackoverflow.com/questions/1284423/read-entire-file-in-scala) are riddled with discussions of historical anecdotes, competing best practices, and so on. This comment has 10 upvotes: *Java isnt that bad if you know the right tools.* `import org.apache.commons.io.FileUtils; FileUtils.readFileToString(new File("file.txt", "UTF-8")`
- Nice ideas like XML as first class with built in XQuery apparently has a huge amount of detractors just when you're starting to cheer for it.
- Setting up a project involves pretty labyrinthine `org` library paths, the use of either Maven or Gradle, `pom.xml` files and a bunch of other stuff. In the end I just dropped the required `jar` in a system-wide folder for global access, just for simplicity.
- I have a vague notion of why some calls chain with or without `.` connecting terms explicitly (as if both Python and Io were mashed together), and why some blocks require enclosing with `{}` while others require `()` (reminiscent of Ruby), and even then why a method declaration has `=` optional between the declaration and the body (returning `Unit` or a specific type), and why some methods can be called without `()`. However, even if these all have reasons to be, they make writing code very confusing. The freeform syntax seems almost in direct opposition to the rigidity of the type system.

So long, Scala!
