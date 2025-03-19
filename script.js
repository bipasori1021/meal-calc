function calculateTDEE() {
    let weight = parseFloat(document.getElementById("weight").value);
    let fatMass = parseFloat(document.getElementById("fatMass").value);
    let muscleMass = parseFloat(document.getElementById("muscleMass").value);
    let activityLevel = parseFloat(document.getElementById("activityLevel").value);
    let exerciseFrequency = parseInt(document.getElementById("exerciseFrequency").value);
    let exerciseIntensity = parseFloat(document.getElementById("exerciseIntensity").value);

    if (isNaN(weight) || isNaN(fatMass) || isNaN(muscleMass)) {
        alert("모든 필드를 입력해주세요!");
        return;
    }

    // Cunningham 공식: BMR = 500 + (22 * 제지방량)
    let leanMass = weight - fatMass;
    let BMR = 500 + (22 * leanMass);

    // TDEE 계산
    let exerciseFactor = (exerciseFrequency * exerciseIntensity) / 7;  
    let TDEE_exercise = BMR * (activityLevel + exerciseFactor);
    let TDEE_rest = BMR * activityLevel;

    document.getElementById("result").innerHTML = `
        <p>📊 기초대사량 (BMR): <strong>${BMR.toFixed(2)} kcal</strong></p>
        <p>💪 운동하는 날 TDEE: <strong>${TDEE_exercise.toFixed(2)} kcal</strong></p>
        <p>🛌 쉬는 날 TDEE: <strong>${TDEE_rest.toFixed(2)} kcal</strong></p>
    `;
}
