[#ftl]
[#import "spring.ftl" as spring]

<h1>freemarker macro test</h1>

[#assign mlink="org.example.ftl.MarkdownLinker"?new()]

[@mlink dest="index.html"][@spring.message "please.return.home"/][/@mlink]
