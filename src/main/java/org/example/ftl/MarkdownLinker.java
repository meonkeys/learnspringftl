package org.example.ftl;

import java.io.IOException;
import java.util.Map;

import freemarker.core.Environment;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * A Freemarker directive useful for generating HTML from phrases containing
 * links.
 */
public class MarkdownLinker implements TemplateDirectiveModel {

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		if (body != null) {
			// getAsString never returns null (unlike toString)
			String dest = ((SimpleScalar) params.get("dest")).getAsString();
			body.render(new MarkdownLinkFilterWriter(env.getOut(), dest));
		} else {
			throw new RuntimeException("missing body");
		}
	}
}
