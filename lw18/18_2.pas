PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 5;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER; 
  Ch: CHAR;  
  FileName: TEXT;  
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student < ClassSize
  DO 
    BEGIN
      WRITELN(OUTPUT, 'Enter the student''s grade soname and number');
      REWRITE(FileName);
      READ(INPUT, Ch);
      IF Ch = ' '
      THEN
        BEGIN
          WHILE NOT EOLN(INPUT) AND (Ch = ' ')
          DO
            READ(INPUT, Ch);
          WRITE(FileName, Ch)
        END
      ELSE
        WRITE(FileName, Ch);
      WHILE (NOT EOLN(INPUT)) AND (Ch <> ' ')
      DO
        BEGIN
          READ(INPUT, Ch);
          IF Ch <> ' '
          THEN
            WRITE(FileName, Ch)
        END;
      TotalScore := 0;
      WhichScore := 1;
      WHILE WhichScore < 5
      DO
        BEGIN
          IF NOT EOLN(INPUT)
          THEN
            READ(NextScore);
          IF (NextScore < 0) OR (NextScore > 100)
          THEN
            WRITELN(OUTPUT, 'NOT CORRECT DATA');
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      WRITE(OUTPUT, 'Average rating of the ');
      RESET(FileName);
      WHILE NOT EOLN(FileName)
      DO
        BEGIN
          READ(FileName, Ch);
          WRITE(OUTPUT, Ch)
        END;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(OUTPUT, ': is ', Ave DIV 10 + 1)  
      ELSE
        WRITELN(OUTPUT, ': is ', Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN;
  WRITELN(OUTPUT, 'Class average:');
  ClassTotal := ClassTotal DIV ((ClassSize - 1) * NumberOfScores);
  WRITELN(OUTPUT, ClassTotal DIV 10, '.',  ClassTotal MOD 10:1)
END.  {AverageScore}

