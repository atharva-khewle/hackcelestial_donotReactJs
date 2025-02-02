import React from "react";

const SuccessModal = ({ data, onClose }) => {
  if (!data) return null;

  // Check if data is a string (application success message) or an object (comparison results)
  const isApplicationSuccess = typeof data === 'string';

  if (isApplicationSuccess) {
    return (
      <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
        <div className="bg-white p-8 rounded-lg shadow-lg max-w-2xl w-full overflow-y-auto">
          <h2 className="text-3xl font-bold text-indigo-900 mb-4">
            Application Submitted
          </h2>
          <p className="mb-6">{data}</p>
          <div className="flex justify-end">
            <button
              className="px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-500"
              onClick={onClose}
            >
              Close
            </button>
          </div>
        </div>
      </div>
    );
  }

  const { job_comparison, recommendation } = data;
  const job1 = job_comparison?.job1 || {};
  const job2 = job_comparison?.job2 || {};

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
      <div className="bg-white p-8 rounded-lg shadow-lg max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <h2 className="text-3xl font-bold text-indigo-900 mb-4">
          Comparison Results
        </h2>

        <div className="mb-6">
          <h3 className="text-2xl font-semibold text-indigo-800 mb-2">Job 1</h3>
          <p className="mb-2">
            <strong>Key Qualifications and Experience:</strong>{" "}
            {job1.key_qualifications_and_experience || "N/A"}
          </p>
          <p className="mb-2">
            <strong>Potential Gaps or Areas for Exploration:</strong>{" "}
            {job1.potential_gaps_or_areas_for_exploration || "N/A"}
          </p>
          <p className="mb-2">
            <strong>Summary:</strong> {job1.summary || "N/A"}
          </p>
        </div>

        <div className="mb-6">
          <h3 className="text-2xl font-semibold text-indigo-800 mb-2">Job 2</h3>
          <p className="mb-2">
            <strong>Key Qualifications and Experience:</strong>{" "}
            {job2.key_qualifications_and_experience || "N/A"}
          </p>
          <p className="mb-2">
            <strong>Potential Gaps or Areas for Exploration:</strong>{" "}
            {job2.potential_gaps_or_areas_for_exploration || "N/A"}
          </p>
          <p className="mb-2">
            <strong>Summary:</strong> {job2.summary || "N/A"}
          </p>
        </div>

        <div className="mb-6">
          <h3 className="text-2xl font-semibold text-indigo-800 mb-2">
            Recommendation
          </h3>
          <p className="mb-2">
            <strong>Better Fit:</strong> {recommendation?.better_fit || "N/A"}
          </p>
          <p className="mb-2">
            <strong>Reason:</strong> {recommendation?.reason || "N/A"}
          </p>
        </div>

        <div className="flex justify-end">
          <button
            className="px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-500"
            onClick={onClose}
          >
            Close
          </button>
        </div>
      </div>
    </div>
  );
};

export default SuccessModal;