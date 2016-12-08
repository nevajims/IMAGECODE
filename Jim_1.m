clear;

resultsDir = 'ResultsSIGGRAPH2013/';
mkdir(resultsDir);
defaultPyrType = 'halfOctave'; % Half octave pyramid is default as discussed in paper
scaleAndClipLargeVideos = false; % With this enabled, approximately 4GB of memory is used

% Baby
inFile = 'clock.avi';
loCutoff = 30;
hiCutoff = 35;
temporalFilter = @differenceOfIIR;
alpha = 1;
sigma = 2;
pyrType = 'octave';
samplingRate = 500;

if (scaleAndClipLargeVideos)
    phaseAmplify(inFile, alpha, loCutoff, hiCutoff, 1, resultsDir, 'sigma', sigma, 'pyrType', pyrType, 'temporalFilter', temporalFilter, 'scaleVideo', 0.8);
else
    phaseAmplify(inFile, alpha, loCutoff, hiCutoff, 1, resultsDir, 'sigma', sigma, 'pyrType', pyrType, 'temporalFilter', temporalFilter, 'scaleVideo', 1);
end
