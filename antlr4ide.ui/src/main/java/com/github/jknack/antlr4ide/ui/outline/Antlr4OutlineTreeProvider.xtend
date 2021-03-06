package com.github.jknack.antlr4ide.ui.outline

import com.github.jknack.antlr4ide.lang.RuleBlock
import com.github.jknack.antlr4ide.lang.LexerRuleBlock
import com.github.jknack.antlr4ide.lang.Option
import com.github.jknack.antlr4ide.lang.V3Token
import com.github.jknack.antlr4ide.lang.V4Token
import com.github.jknack.antlr4ide.lang.Import
import org.eclipse.xtext.ui.editor.outline.impl.DefaultOutlineTreeProvider
import com.github.jknack.antlr4ide.lang.Grammar
import org.eclipse.xtext.ui.editor.outline.impl.DocumentRootNode

/**
 * Customization of the default outline structure.
 *
 * see http://www.eclipse.org/Xtext/documentation.html#outline
 */
class Antlr4OutlineTreeProvider extends DefaultOutlineTreeProvider {

  def void _createChildren(DocumentRootNode outlineNode, Grammar grammar) {
    grammar.prequels.forEach [ prequel |
      createNode(outlineNode, prequel);
    ]

    grammar.rules.forEach [ rule |
      createNode(outlineNode, rule);
    ]

    grammar.modes.forEach [ mode |
      createNode(outlineNode, mode);
    ]
  }

  def _isLeaf(Option option) {
    return true
  }

  def _isLeaf(V3Token token) {
    return true
  }

  def _isLeaf(V4Token token) {
    return true
  }

  def _isLeaf(Import imports) {
    return true;
  }

  def _isLeaf(RuleBlock block) {
    return true
  }

  def _isLeaf(LexerRuleBlock block) {
    return true
  }

  def _isLeaf(com.github.jknack.antlr4ide.lang.Exceptions exceptions) {
    return true
  }
}
