function [corpus_words, num_corpus_words, corpus_text_words] = distinctWords(corpus)
  num_corpus_words = -1;
  corpus_words = [];
  corpus_text_words = [];
  
  while ~isempty(corpus)
    [str, corpus] = strtok(corpus, [' @$/#.-:&*+=[]?!(){}"_;%' char(10) char(13)]);
    str = regexprep(str, "[^a-zA-Zа-яА-я0-9'><]", '');
    corpus_text_words = [corpus_text_words; str];
  endwhile
  
  corpus_words = unique(corpus_text_words, "rows");
  num_corpus_words = length(corpus_words);

  sort(corpus_words);
end