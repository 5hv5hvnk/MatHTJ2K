function fdwt(hTile, main_header, c, use_MEX)
M_OFFSET = 1;
<<<<<<< HEAD
=======
mhead_COD = main_header.COD;
mhead_SIZ = main_header.SIZ;
mhead_QCD = main_header.QCD;
mhead_COM = main_header.COM;
mhead_CAP = main_header.CAP;
% save('myFile.txt',mhead_COD,'-ascii');
>>>>>>> CSV output for images

[codingStyle, codingStyleComponent] = get_coding_Styles(main_header, hTile.header, c);
dwt_filter = codingStyleComponent.get_transformation();
NL = codingStyleComponent.get_number_of_decomposition_levels();

lev = 0;

LL = hTile.components(c + M_OFFSET).samples;
<<<<<<< HEAD

=======
idx=1;
% coff_2=0;
% coff_3=0;
>>>>>>> CSV output for images
while lev < NL
    currentResolution = findobj(hTile.resolution, 'idx', NL - lev, '-and', 'idx_c', c);
    u0 = currentResolution.trx0;
    u1 = currentResolution.trx1;
    v0 = currentResolution.try0;
    v1 = currentResolution.try1;
    if u0 == u1 || v0 == v1
        % if we are here, current resolution is empty.
        break;
    end
    if use_MEX == true
        [LL, HL, LH, HH] = fdwt_2d_sd_mex(LL, u0, u1, v0, v1, dwt_filter);
    else
        [LL, HL, LH, HH] = fdwt_2d_sd(LL, u0, u1, v0, v1, dwt_filter);
    end
<<<<<<< HEAD
    currentResolution.subbandInfo(1).dwt_coeffs = HL;
    currentResolution.subbandInfo(2).dwt_coeffs = LH;
    currentResolution.subbandInfo(3).dwt_coeffs = HH;
    lev = lev + 1;
end

=======
    currentResolution.subbandInfo(1).dwt_coeffs = HL;
    currentResolution.subbandInfo(2).dwt_coeffs = LH;
    currentResolution.subbandInfo(3).dwt_coeffs = HH;
    
    %this saves CSV files of dwt coffecients for all resolutions
    coff_1=HL;
    coff_2=LH;
    coff_3=HH;
    coff_4=LL;
    fileName1 = strcat('00000201_',num2str(idx),'_HL.csv')
    fileName2 = strcat('00000201_',num2str(idx),'_LH.csv')
    fileName3 = strcat('00000201_',num2str(idx),'_HH.csv')
    fileName4 = strcat('00000201_',num2str(idx),'_LL.csv')
    csvwrite(fileName1,coff_1);
    csvwrite(fileName2,coff_2);
    csvwrite(fileName3,coff_3);
    csvwrite(fileName4,coff_4);
    lev = lev + 1;
    idx=idx+1;
end
>>>>>>> CSV output for images
currentResolution = findobj(hTile.resolution, 'idx', NL - lev, '-and', 'idx_c', c);
currentResolution.subbandInfo(1).dwt_coeffs = LL;
