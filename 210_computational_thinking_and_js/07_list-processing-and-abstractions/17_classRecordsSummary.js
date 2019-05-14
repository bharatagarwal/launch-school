let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function generateClassRecordSummary(scores) {
  const summaryObject = {
    studentGrades: [],
    exams: [[], [], [], []],
  };

  // for each student, compute their score
  // generate grade
  // store exam scores for appropriate index for exam
  // map over exams values, and generate objects for return value.

  Object.keys(scores).forEach((student) => {
    let studentAverageScore = 0;
    let examScores = scores[student].scores.exams.reduce((sum, score) => sum + score);
    let exerciseScores = scores[student].scores.exercises.reduce((sum, score) => sum + score);

    summaryObject.exams.forEach(function(exam, index) {
      exam.push(scores[student].scores.exams[index]);
    });

    studentAverageScore = Math.round((examScores / 4) * 0.65 + exerciseScores * 0.35);
    summaryObject.studentGrades.push(grade(studentAverageScore));
  })

  summariseExams(summaryObject);
  return summaryObject;
}

function grade(score) {
  if (score >= 93 && score <= 100) {
    return `${score} (A)`;
  } else if (score >= 85) {
    return `${score} (B)`;
  } else if (score >= 77) {
    return `${score} (C)`;
  } else if (score >= 69) {
    return `${score} (D)`;
  } else if (score >= 60) {
    return `${score} (E)`;
  } else if (score >= 0 && score <= 59) {
    return `${score} (F)`;
  }
}

function summariseExams(summaryObject) {
  summaryObject.exams = summaryObject.exams.map(function (grades) {
    return {
      average: Math.round((grades.reduce((sum, a) => sum + a) * 10 / grades.size)) / 10,
      minimum: grades.reduce((lowest, a) => a <= lowest ? lowest : a),
      maximum: grades.reduce((highest, a) => a >= highest ? highest : a),
    };
  });
}

console.log(generateClassRecordSummary(studentScores));

// returnskey: "value", 
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }