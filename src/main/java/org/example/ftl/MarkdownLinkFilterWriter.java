package org.example.ftl;

import java.io.IOException;
import java.io.Writer;

import com.petebevin.markdown.MarkdownProcessor;

/**
 * A {@link Writer} that transforms the plain-text Markdown character stream to
 * HTML and forwards it to another {@link Writer}. Note that the marked-down
 * text is further edited: the paragraph element (automatically and always added
 * by Markdown) is removed. The intended use of this class is within a directive
 * which creates HTML links from i18n messages, and it may be undesirable to also
 * wrap a message in a paragraph element.
 */
public class MarkdownLinkFilterWriter extends Writer {

	private final Writer out;
	private final String dest;

	MarkdownLinkFilterWriter(Writer out, String dest) {
		this.out = out;
		this.dest = dest;
	}

	public void write(char[] cbuf, int off, int len) throws IOException {
		StringBuffer slurped = new StringBuffer();
		for (int i = 0; i < len; i++) {
			slurped.append(cbuf[i + off]);
		}
		String replaced = String.format(slurped.toString(), dest);
		String markedDown = new MarkdownProcessor().markdown(replaced);
		markedDown = markedDown.replace("<p>", "");
		markedDown = markedDown.replace("</p>", "");
		out.write(markedDown);
	}

	public void flush() throws IOException {
		out.flush();
	}

	public void close() throws IOException {
		out.close();
	}
}