clear ; close all; clc;

START_TOKEN = '<START>';
END_TOKEN = '<END>';

test_corpus = ["<START> All that glitters isn't gold <END>\n", "<START> All's well that ends well <END>\n"];

[M_test, word2Ind_test] = computeCoOccurrenceMatrix(test_corpus, 1);