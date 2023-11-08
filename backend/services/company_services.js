const companyModel = require('../models/company_model');
const studentModel = require('../models/student_model');    
const jwt = require('jsonwebtoken');

class companyService{
    static async registercompany(email,name,department){
        try{
            const createcompany = new companyModel({email,name,department});
            return await createcompany.save();
        }catch(err){
            throw err;
        }
    }

    static async checkcompany(email){
        try {
            return await companyModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    static async generatetoken(tokenData, secretKey, jwt_expiry){
        return jwt.sign(tokenData, secretKey, {expiresIn: jwt_expiry});
    }

    static async getAllCompanies() {
        try {
            return await companyModel.find({});
        } catch (error) {
            throw error;
        }
    }

    static async addStudentToCompany(companyEmail, studentSapid) {
        try {
            // Find the company by its email to get its unique 'id'
            const company = await companyModel.findOne({ email: companyEmail });
    
            if (company) {
                // Check if the student's 'Sapid' is already in the 'studentsApplied' array
                if (company.studentsApplied.includes(studentSapid)) {
                    return "Student already added to this company"; // Return a message if the student is already in the array
                }
    
                // Verify if the student with the given 'Sapid' exists
                const studentExists = await studentModel.findOne({ Sapid: studentSapid });
    
                if (studentExists) {
                    // If the student exists, push their 'Sapid' into the 'studentsApplied' array of the company
                    company.studentsApplied.push(studentSapid);
    
                    // Save the updated company
                    const updatedCompany = await company.save();
                    return updatedCompany;
                } else {
                    return "Student not found"; // Return a message if the student with the specified 'Sapid' was not found
                }
            } else {
                return "Company not found"; // Return a message if the company with the specified email was not found
            }
        } catch (error) {
            throw error;
        }
    }
    
    
    
}



module.exports = companyService;