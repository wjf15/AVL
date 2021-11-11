function num = parseSTDATA(fileID, name)
j = 1;
linebreaks = [1];
testfile = fileread(fileID);
for i = 1: length(testfile)
    if testfile(i) == char(10)
        linebreaks(end + 1) = i;
    end
end
for i = 1:numel(linebreaks) - 1
    str = testfile(linebreaks(i):linebreaks(i+1))
    subst = regexp(str, name);
    if subst ~= 0
        str
        word = char(str(subst:subst+length(name) - 1));

        [str2i,str2e] = regexp(str, ' = ');
        str3i= regexp(str, ' ','split')
        k = 1;
        for j = 1: numel(str3i)
            if length(char(str3i(j))) <= 1
                str3i{j} = [];
            else
                str3i{k} = str3i{j};
                str3i{j} = [];
                k = k+1;
            end
        end
        class(str3i(1))
        str3i(4)
        for t = 1: k
            if string(str3i{t}) == string(name)
                num = str2double(str3i{t+1});
            end
        end
    end
end
end