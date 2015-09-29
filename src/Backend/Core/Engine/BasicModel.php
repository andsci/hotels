<?php

namespace Backend\Core\Engine;
use Backend\Core\Engine\Model as BackendModel;

/**
 * This class defines basic functions for a module model
 */
class BasicModel
{
    /**
     * Checks if given records exists in database table
     *
     * @param string $table   Database table name.
     * @param array  $value   Values for where query
     * @param string $where   Where query
     *
     * @return bool
     */
    public static function existsRecord($table, $value, $where = 'id = ?')
    {
        return (bool) BackendModel::getContainer()->get('database')->getVar(
            'SELECT 1
             FROM '.$table.'
             WHERE '.$where, $value);
    }

    /**
     * Insert given record into database
     *
     * @param string $table     Database table name.
     * @param array $values     Values that will be inserted into the database
     *
     * @return int
     */
    public static function insertRecord($table, $values)
    {
        return BackendModel::getContainer()->get('database')->insert($table, $values);
    }

    /**
     * Update database record
     *
     * @param string $table        Database table name.
     * @param array  $values       Values which will be for update
     * @param array  $whereValues  Values for where query
     * @param string $where        Where query
     */
    public static function updateRecord($table, $values, $whereValues, $where = 'id = ?')
    {
        BackendModel::getContainer()->get('database')->update($table, $values, $where, $whereValues);
    }

    /**
     * Delete database record
     *
     * @param string $table        Database table name.
     * @param array  $whereValues  Values for where query
     * @param string $where        Where query
     */
    public static function deleteRecord($table, $whereValues, $where = 'id = ?')
    {
        BackendModel::getContainer()->get('database')->delete($table, $where, $whereValues);
    }

    /**
     * Get all table records
     *
     * @param string $table        Database table name.
     *
     * @return array
     */
    public static function getAllRecords($table)
    {
        return (array) BackendModel::getContainer()->get('database')->getRecords(
            'SELECT *
             FROM '.$table);
    }

    /**
     * Get multiple records
     *
     * @param string $table        Database table name.
     * @param array  $whereValues  Values for where query
     * @param string $where        Where query
     *
     * @return array
     */
    public static function getRecords($table, $whereValues, $where = 'id = ?')
    {
        return (array) BackendModel::getContainer()->get('database')->getRecords(
            'SELECT *
             FROM '.$table.'
             WHERE '.$where, $whereValues);
    }

    /**
     * Get a single record
     *
     * @param string $table        Database table name.
     * @param array  $whereValues  Values for where query
     * @param string $where        Where query
     *
     * @return array
     */
    public static function getRecord($table, $whereValues, $where = 'id = ?')
    {
        return (array) BackendModel::getContainer()->get('database')->getRecord(
            'SELECT *
             FROM '.$table.'
             WHERE '.$where,
            $whereValues);
    }

    /**
     * Get record translations indexed by language
     *
     * @param string $table        Database table name.
     * @param array  $whereValues  Values for where query
     * @param string $where        Where query
     *
     * @return array
     */
    public static function getTranslations($table, $whereValues, $where = 'id = ?')
    {
        $translations = (array) BackendModel::getContainer()->get('database')->getRecords(
            'SELECT *
             FROM '.$table.'
             WHERE '.$where, $whereValues);

        $result = array();

        foreach($translations as $translation) {
            $result[$translation['language']]  = $translation;
        }

        return $result;
    }
}