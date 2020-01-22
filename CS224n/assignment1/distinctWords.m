function [corpus_words, num_corpus_words] = distinctWords(corpus)
  num_corpus_words = -1;
  corpus_words = [];
  
  while ~isempty(corpus)
    [str, corpus] = strtok(corpus, [' @$/#.-:&*+=[]?!(){}"_;%' char(10) char(13)]);
    str = regexprep(str, "[^a-zA-Zа-яА-я0-9'><]", '');
    corpus_words = [corpus_words; str];
  endwhile
  
  corpus_words = unique(corpus_words, "rows");

  sort(corpus_words);
end