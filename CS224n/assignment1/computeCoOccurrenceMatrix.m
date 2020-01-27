function [M, word2Ind] = computeCoOccurrenceMatrix(corpus, window_size)
  global START_TOKEN;
  global END_TOKEN;

  [words, num_words, text_words] = distinctWords(corpus);
  
  M = zeros(num_words);
  d = {};
  body_corpus = 1;
  
  for i = 1:size(text_words,1)
    str_m = text_words{1,:};
  endfor
  
  for j = 1:length(text_words)
    word = text_words(j,:);
    
    r = j-window_size:j+window_size;
    r(r==j) = [];
    r(r<1) = [];
    r(r>length(text_words)) = [];
    
    setfield(d, word, text_words(r, :));
  endfor
  
  disp(d);
end