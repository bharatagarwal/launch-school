var studentScores = {
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
  var summaryObject = {
    studentGrades: [],
    exams: [[], [], [], []],
  };

  Object.keys(scores).forEach((student) => {
    let examScores = scores[student].scores.exams;
    let exerciseScores = scores[student].scores.exercises
    let averageScore = calculateAverageScore(examScores, exerciseScores);

    let studentGrade = grade(averageScore);
    summaryObject.studentGrades.push(studentGrade);
    
    recordStudentExamPerformance(summaryObject.exams, examScores)
  })

  summariseExams(summaryObject);
  return summaryObject;
}

function calculateAverageScore(examsArray, exerciseArray) {
  let examTotal = examsArray.reduce((sum, score) => sum + score);
  let exerciseTotal = exerciseArray.reduce((sum, score) => sum + score);
  let averageScore = (examTotal / 4) * 0.65 + exerciseTotal * 0.35;

  return Math.round(averageScore);
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

function recordStudentExamPerformance(recordArray, examScores) {
  recordArray.forEach((exam, index) => {
    recordArray[index].push(examScores[index]);
  });
}


function summariseExams(summaryObject) {
  summaryObject.exams = summaryObject.exams.map(function (grades) {
    return {
      average: averageRoundedToFirstDigit(grades),
      minimum: grades.reduce((lowest, a) => a >= lowest ? lowest : a),
      maximum: grades.reduce((highest, a) => a <= highest ? highest : a),
    };
  });
}

function averageRoundedToFirstDigit(grades) {
  let gradeTotal = grades.reduce((sum, grade) => sum + grade);
  let gradeAverage = gradeTotal / grades.length;
  return Math.round(gradeAverage * 10) / 10;
}

console.log(generateClassRecordSummary(studentScores));