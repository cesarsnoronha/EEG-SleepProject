function [ chanlocs ] = get_chanlocs_from_labels( chan_labels )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

folder = which('pop_dipfit_settings');
folder = folder(1:end-21);
locsfile = fullfile(folder, 'standard_BESA', 'standard-10-5-cap385.elp');
tmplocs = execFunc('readlocs', locsfile, 'defaultelp', 'BESA');
[tmp ind1 ind2] = intersect_bc(lower({ tmplocs.labels }), lower(chan_labels));

if ~isempty(tmp)
    chanlocs = struct('labels', chan_labels);
    [ind2 ind3] = sort(ind2);
    ind1 = ind1(ind3);

    for index = 1:length(ind2)
        chanlocs(ind2(index)).theta      = tmplocs(ind1(index)).theta;
        chanlocs(ind2(index)).radius     = tmplocs(ind1(index)).radius;
        chanlocs(ind2(index)).X          = tmplocs(ind1(index)).X;
        chanlocs(ind2(index)).Y          = tmplocs(ind1(index)).Y;
        chanlocs(ind2(index)).Z          = tmplocs(ind1(index)).Z;
        chanlocs(ind2(index)).sph_theta  = tmplocs(ind1(index)).sph_theta;
        chanlocs(ind2(index)).sph_phi    = tmplocs(ind1(index)).sph_phi;
        chanlocs(ind2(index)).sph_radius = tmplocs(ind1(index)).sph_radius;
    end;
    tmpdiff = setdiff_bc([1:length(chanlocs)], ind2);
    if ~isempty(tmpdiff)
        fprintf('Channel lookup: no location for ');
        for index = 1:(length(tmpdiff)-1)
            fprintf('%s,', chanlocs(tmpdiff(index)).labels);
        end;
        fprintf('%s\nSend us standard location for your channels at eeglab@sccn.ucsd.edu\n', ...
            chanlocs(tmpdiff(end)).labels);
    end;
    if ~isfield(chanlocs, 'type'), chanlocs(1).type = []; end;
end;

for index = 1:length(chanlocs)
    chanlocs(index).urchan    = index;
    chanlocs(index).ref       = '';
end

